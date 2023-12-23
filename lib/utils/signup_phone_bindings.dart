import 'package:get/get.dart';

import '../controller/signup_phone_controller.dart';

class SignUpPhoneBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(PhoneSignUpController());
  }
}
