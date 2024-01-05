import 'package:fluter_ecom/controller/current_postion_controller.dart';
import 'package:get/get.dart';

class CurrentPositionBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CurrentPositionController());
  }
}
