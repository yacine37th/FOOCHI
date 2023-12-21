import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/verify_email_controller.dart';
import '../theme/assets.dart';
import '../theme/main_colors.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    EmailVerificationController emailVerificationController = Get.find();
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      appBar: AppBar(
        backgroundColor: AppColors.kBackground,
        elevation: 1,
        leading: IconButton(
            onPressed: () {
              navigator!.pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColors.kPrimary,
            )),
        title: const Text(
          "Email Verification",
          style: TextStyle(color: AppColors.kPrimary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //  Center(child:
              Image.asset(AppAssets.kAppLogo),
              //  ),
              const SizedBox(height: 20),
              const Text(
                  "A verification email has been sent to your email address",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  emailVerificationController.resendVerificationEmail();
                },
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Container(
                    height: 55,
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: AppColors.kPrimary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Resend",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
