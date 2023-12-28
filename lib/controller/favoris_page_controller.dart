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
    }
    update();
  }

  @override
  void onInit() {
    getFavoris();
    super.onInit();
  }
}
