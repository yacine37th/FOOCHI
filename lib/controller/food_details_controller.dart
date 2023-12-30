import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluter_ecom/controller/carte_controller.dart';
import 'package:fluter_ecom/functions/functions.dart';
import 'package:fluter_ecom/main.dart';
import 'package:fluter_ecom/model/carte_model.dart';
import 'package:get/get.dart';

import '../model/food_model.dart';

class FoodDetailsController extends GetxController {
  late FoodModel singleFood = Get.arguments["0"];
  CarteController carteController = Get.find();
  // print(singleFood.name);
  int counter = 1;

  void increaseCart() {
    counter++;
    update();
  }

  void decreaseCart() {
    if (counter > 1) {
      counter--;
    } else {
      counter = 1;
    }
    update();
  }

  Future addToCart(String foodID, FoodModel food) async {
    // print(carteController.orederList.containsKey(foodID));
    // for (var i = 0; i < carteController.orederList.length; i++) {
    //   print(carteController.orederList.keys);
    // }
    // print(carteController.orederList.keys);
    if (carteController.orederList.containsKey(foodID)) {
      MainFunctions.somethingWentWrongSnackBar("Item Already exists");
    } else
    // if (!carteController.orederList.containsKey(foodID))
    {
      var doc = FirebaseFirestore.instance.collection("carte").doc();
      await doc.set({
        "carteFoodID": foodID,
        "carteFoodQte": counter,
        "carteFoodIsConfirm": false,
        "carteID": doc.id,
        "carteUserID": currentUserInfos.uID,
      });
      carteController.orederList.addAll({
        foodID: CarteModel(
            id: foodID,
            qte: counter,
            userID: currentUserInfos.uID,
            isConfirm: false,
            imageUrl: food.image,
            foodPrice: food.price as int,
            foodName: food.name)
      });
      carteController.total += food.price! * counter;
      MainFunctions.successSnackBar("Added Succefully");
    }
  }
}
