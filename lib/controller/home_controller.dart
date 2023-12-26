import 'package:fluter_ecom/model/category_model.dart';
import 'package:fluter_ecom/model/food_model.dart';
import 'package:fluter_ecom/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
  final controller02 = ValueNotifier<bool>(false);
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
              name: value.docs[index]["userName"])
        });
      }
    });
    print("users /////////////////////////////");
    update();
  }

  getCategories() async {
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
  }

  getFood() async {
    await FirebaseFirestore.instance
        .collection("food")
        // .limit(2)
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
  }
//////// fetch when scrolling to bottom

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

  ScrollController? scrollController;
  var getMore = true;
  var isFetching = false;

  void _scrollListener() async {
    print("******************");
    if (getMore) {
      if (scrollController?.position.pixels ==
              scrollController?.position.maxScrollExtent &&
          isFetching == false) {
        isFetching = true;
        // await getRequestedBooks();
        isFetching = false;
      }
    }
  }

  @override
  void onInit() {
    getUsers();
    getCategories();
    getFood();
    scrollController = ScrollController()..addListener(_scrollListener);

    super.onInit();
  }
}
