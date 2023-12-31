import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../functions/functions.dart';

class EmailVerificationController extends GetxController {
  bool isEmailVerified = false;
  resendVerificationEmail() async {
    if (!isEmailVerified) {
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();
    }
  }

  checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
  }

  @override
  void onInit() {
    Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        checkEmailVerified();
        if (isEmailVerified) {
          timer.cancel();
          MainFunctions.successSnackBar("Account confirmed, log in");
          Get.offAllNamed("/SignIn");
        }
      },
    );
    super.onInit();
  }

}
