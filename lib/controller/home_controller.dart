import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluter_ecom/controller/favoris_page_controller.dart';
import 'package:fluter_ecom/model/category_model.dart';
import 'package:fluter_ecom/model/food_model.dart';
import 'package:fluter_ecom/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shake/shake.dart';

import '../main.dart';

class HomeController extends GetxController {
  final controller02 = ValueNotifier<bool>(false);
  FavorisPageController favorisPageController =
      Get.put(FavorisPageController());

  Map<String, UserModel> usersRef = {};
  Map<String, CategoryModel> categories = {};
  Map<String, FoodModel> foods = {};
  bool isPressed = false;
  getUsers() async {
    await FirebaseFirestore.instance
        .collection("users")
        .get()
        .then((value) async {
      for (int index = 0; index < value.docs.length; index++) {
        usersRef.addAll({
          value.docs[index].id: UserModel(
              uID: value.docs[index].id,
              email: value.docs[index]["userEmail"],
              name: value.docs[index]["userName"],
              foodFavoris: ["${value.docs[index]["userFavorisFood"]}"],
              latitude: 0,
              longitude: 0)
        });
      }
    });
    print("users /////////////////////////////");
    update();
  }

  Future getCategories() async {
    await FirebaseFirestore.instance
        .collection("categories")
        .get()
        .then((value) async {
      for (int index = 0; index < value.docs.length; index++) {
        categories.addAll({
          value.docs[index].id: CategoryModel(
              uID: value.docs[index].id,
              name: value.docs[index]["categoryName"])
        });
      }
    });
    update();
  }

  Future getFood() async {
    foods.clear();
    await FirebaseFirestore.instance
        .collection("food")
        .limit(6)
        .get()
        .then((value) async {
      for (int index = 0; index < value.docs.length; index++) {
        foods.addAll({
          value.docs[index].id: FoodModel(
              uID: value.docs[index].id,
              name: value.docs[index]["foodName"],
              price: value.docs[index]["foodPrice"],
              image: value.docs[index]["foodImage"])
        });
      }
    });
    print("1");
    update();
  }

///////////add to dataBase
  putFood() async {
    for (int i = 0; i < 18; i++) {
      final doc = FirebaseFirestore.instance.collection("food").doc();
      await doc.set({
        "foodName": "Pizza grecque ${i}",
        "foodImage":
            "https://cdn.shopify.com/s/files/1/0570/1831/9042/files/margharita-pizza.jpg?v=1653400814",
        "foodID": doc.id,
        "foodPrice": 14 + i as int,
      });
    }
  }

////////Signout
  signOutOfAnExistingAccount() async {
    await FirebaseAuth.instance.signOut().then((value) {
      currentUser = null;
      Get.offAllNamed("/SignIn");
    });
  }

//////add to Favoris
  addToFavoris(String foodID, FoodModel food) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser!.uid)
        .update({
      "userFavorisFood": FieldValue.arrayUnion([foodID])
    });
    currentUserInfos.foodFavoris.add(foodID);
    var doc =
        await FirebaseFirestore.instance.collection("food").doc(food.uID).get();
    favorisPageController.favorisFood.addAll({
      doc.id: FoodModel(
          uID: doc.id,
          name: doc["foodName"],
          price: doc["foodPrice"],
          image: doc["foodImage"])
    });
    // favorisPageController.favoris.add(foodID);
    update();
  }

  removeFromFavoris(String foodID, FoodModel food) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser!.uid)
        .update({
      "userFavorisFood": FieldValue.arrayRemove([foodID])
    });
    currentUserInfos.foodFavoris.remove(foodID);
    favorisPageController.favoris.remove(foodID);
    favorisPageController.favorisFood.remove(foodID);
    update();
  }

//  await FirebaseFirestore.instance
//               .collection("books")
//               .orderBy("bookDateAdded", descending: true)
//               .startAfterDocument(await FirebaseFirestore.instance
//                   .collection("books")
//                   .doc(requestedBooks.values.last.id)
//                   .get())
//               .limit(9)
//               .get()
//               .then((value) {
//             if (value.docs.isEmpty) {
//               getMore = false;
//               print("*******dddddd***********");
//             }
//             for (int index = 0; index < value.docs.length; index++) {
//               requestedBooks.addAll({
//                 value.docs[index].id: BookModel(
//                     id: value.docs[index].id,
//                     authorName: value.docs[index]["bookAuthorName"],
//                     authorId: value.docs[index]["bookAuthorID"],
//                     ratings: value.docs[index]["bookRatings"].toDouble(),
//                     reads: value.docs[index]["bookReads"],
//                     title: value.docs[index]["bookTitle"],
//                     category: value.docs[index]["bookCategory"],
//                     thumbnail: value.docs[index]["bookThumnail"],
//                     aboutBook: value.docs[index]["bookAbout"],
//                     url: value.docs[index]["bookURL"],
//                     publishingHouse: value.docs[index]["bookPublishingHouse"],
//                     price: value.docs[index]["bookPrice"].toDouble())
//               });
//             }

//             print("AppBarType.mostRecentBooks");
//           });
  late ShakeDetector detector;
  double counter = 15;
  void shakePhone() {
    detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //     content: Text('Shake!'),
        //   ),
        // );
        print("SHAKE *////////////*************");
        print(counter);
        counter++;
        update();
        // Do stuff on phone shake
      },
      minimumShakeCount: 1,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );
  }

  @override
  void onInit() {
    getCategories();
    getFood();
    shakePhone();
    super.onInit();
  }
}
