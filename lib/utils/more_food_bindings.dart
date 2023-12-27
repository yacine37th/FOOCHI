import 'package:fluter_ecom/controller/more_food_controller.dart';
import 'package:get/get.dart';

class MoreFoodBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(MoreFoodController());
  }
}
