import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/forgot_password_controller.dart';
import '../theme/main_colors.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordController forgotPasswordController = Get.find();
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              navigator!.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColors.kPrimary,
              // size: 18,
            )),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          height: screenHeight / 1.35,
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: forgotPasswordController.pageController,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "نسيت كلمة المرور ؟",
                    style: TextStyle(
                        fontFamily: 'Cairo', fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "أدخل بريدك الاكتروني، و سنرسل لك رابطا لادخال كلمة سر جديدة",
                    style: TextStyle(fontFamily: 'Cairo', fontSize: 17),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Form(
                    key: forgotPasswordController.emailFormKey,
                    child: Column(
                      children: [
                        GetBuilder<ForgotPasswordController>(
                            builder: (context) {
                          return TextFormField(
                            style: const TextStyle(color: Colors.black),
                            textInputAction: TextInputAction.done,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "من فضلك املأ البريد الإلكتروني";
                                ;
                              }
                              if (!RegExp(
                                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                  .hasMatch(val)) {
                                return "من فضلك املأ بريد إلكتروني صحيح";
                              }

                              return null;
                            },
                            onChanged: (emailAddress) {
                              forgotPasswordController
                                  .inputfgbEmail(emailAddress);
                            },
                            decoration: InputDecoration(
                              hintText: 'Your Email',
                              errorMaxLines: 2,
                              prefixIcon:
                                  Icon(Icons.email, color: AppColors.kLine),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 16),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: AppColors.kLine),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: AppColors.kOrange),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: AppColors.kLine),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: AppColors.KError),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.grey),
                            ),
                          );
                        }),
                        const SizedBox(
                          height: 25,
                        ),
                        TextButton(
                            style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(
                                    const Size(double.maxFinite, 60))),
                            onPressed: () {
                              if (forgotPasswordController
                                  .emailFormKey.currentState!
                                  .validate()) {
                                forgotPasswordController
                                    .emailFormKey.currentState!
                                    .save();
                                forgotPasswordController.sendEmail();
                              }
                            },
                            child: const Text("ارسال الرابط",
                                style: TextStyle(fontFamily: 'Cairo'))),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Text.rich(TextSpan(
                      style: const TextStyle(fontFamily: 'Cairo', fontSize: 17),
                      children: [
                        const TextSpan(
                            text:
                                "تم ارسال بريد الكتروني لتغيير كلمة السر الى حسابك : "),
                        TextSpan(
                            text: forgotPasswordController.fgpEmail.toString())
                      ])),
                  const SizedBox(height: 20),
                  TextButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                              const Size(double.maxFinite, 60))),
                      onPressed: () {
                        navigator!.pop();
                      },
                      child: const Text(
                        "حسنا",
                        style: TextStyle(fontFamily: 'Cairo'),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
