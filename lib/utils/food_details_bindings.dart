import 'package:fluter_ecom/controller/food_details_controller.dart';
import 'package:get/get.dart';

class FoodDetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(FoodDetailsController());
  }
}
