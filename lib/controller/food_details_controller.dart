import 'package:get/get.dart';

class FoodDetailsController extends GetxController {
  int counter = 1;

  void increaseCart() {
    counter++;
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
