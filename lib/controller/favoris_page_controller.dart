import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluter_ecom/main.dart';
import 'package:fluter_ecom/model/food_model.dart';
import 'package:get/get.dart';

class FavorisPageController extends GetxController {
  List favoris = currentUserInfos.foodFavoris;
  Map<String, FoodModel> favorisFood = {};
  getFavoris() async {
    for (var element in favoris) {
      var doc = await FirebaseFirestore.instance
          .collection("food")
          .doc(element)
          .get();
      favorisFood.addAll({
        doc.id: FoodModel(
            uID: doc.id,
            name: doc["foodName"],
            price: doc["foodPrice"],
            image: doc["foodImage"])
      });
      //     .then((value) async {
      //   for (int index = 0; index < value.docs.length; index++) {
      //     favorisFood.addAll({
      //       value.docs[index].id: FoodModel(
      //           uID: value.docs[index].id,
      //           name: value.docs[index]["foodName"],
      //           price: value.docs[index]["foodPrice"],
      //           image: value.docs[index]["foodImage"])
      //     });
      //   }
      // });
    }
    for (var i = 0; i < favorisFood.length; i++) {
      print(favorisFood.values.elementAt(i).name);
    }
    update();
  }

@override
  void onInit() {
    // TODO: implement onInit
    getFavoris();
    super.onInit();
  }
}
