import 'package:get/get.dart';

import '../model/food_model.dart';

class FoodDetailsController extends GetxController {
  late FoodModel singleFood = Get.arguments["0"];
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
}
