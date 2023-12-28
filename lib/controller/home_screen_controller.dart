import 'package:fluter_ecom/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  @override
  onInit() async {
    update();

    Get.put(HomeController());
    // Get.put(TasnifatController());
    // Get.put(MaktabatiController()); //account controller
    // Get.put(MaxSubscriptionController());

    super.onInit();
  }
}
