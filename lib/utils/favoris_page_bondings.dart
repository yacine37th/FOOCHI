import 'package:fluter_ecom/controller/favoris_page_controller.dart';
import 'package:get/get.dart';

class FavorisPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(FavorisPageController());
  }
}
