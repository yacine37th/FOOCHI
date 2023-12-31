import 'package:fluter_ecom/controller/check_out_controller.dart';
import 'package:get/get.dart';

class CheckoutBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CheckOutController());
  }
}
