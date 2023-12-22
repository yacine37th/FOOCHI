import 'package:fluter_ecom/controller/foochi_onboarding_controller.dart';
import 'package:get/get.dart';

class OnboardingBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(FoochiOnboardingController());
  }
}
