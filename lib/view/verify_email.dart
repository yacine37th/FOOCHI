import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/verify_email_controller.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    EmailVerificationController emailVerificationController = Get.find();
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //     onPressed: () {
        //       navigator!.pop();
        //     },
        //     icon: const IconButtonBack()),
        title: const Text("Vérification de l'E-mail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                 "A verification email has been sent to your email address",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    emailVerificationController.resendVerificationEmail();
                  },
                  child: const Text("Resend",
                      style: TextStyle(
                        fontSize: 20,
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
