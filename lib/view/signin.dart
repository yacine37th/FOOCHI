import 'package:fluter_ecom/controller/signin_controller.dart';
import 'package:fluter_ecom/theme/main_colors.dart';
import 'package:fluter_ecom/view/social_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../animation/fade_animation.dart';
import '../controller/signup_constroller.dart';
import '../theme/assets.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    SignInController signInController = Get.find();
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      body: SafeArea(
        child: ListView(
          clipBehavior: Clip.antiAlias,
          physics: const BouncingScrollPhysics(),
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: signInController.formKey,
                child: FadeAnimation(
                  delay: 2,
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
                      Center(child: Image.asset(AppAssets.kAppLogo)),
                      const SizedBox(height: 30),
                      const Text('Sign In',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                signInController.signInWithGoogle();
                              },
                              child: Card(
                                elevation: 0,
                                color: Colors.transparent,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.kOrange,
                                    border: Border.all(color: AppColors.kLine),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(AppAssets.kGoogle),
                                      const SizedBox(width: 14),
                                      const Text(
                                        'with Google',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              signInController.signInWithFacebook();
                            },
                            child: Card(
                              elevation: 0,
                              color: Colors.transparent,
                              child: Container(
                                height: 50,
                                width: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: null,
                                  border: Border.all(color: AppColors.kLine),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(AppAssets.kFacebook),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Card(
                              elevation: 0,
                              color: Colors.transparent,
                              child: Container(
                                height: 50,
                                width: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: null,
                                  border: Border.all(color: AppColors.kLine),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(AppAssets.kTwitter),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),

                      const SizedBox(
                        height: 30,
                        child: Text(
                          "Or with Email",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (userEmailAddress) {
                          signInController.userEmailAddress = userEmailAddress;
                        },
                        onChanged: (userEmailAddress) {
                          signInController.userEmailAddress =
                              userEmailAddress.trim();
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please fill Your Email ";
                          }
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                              .hasMatch(val)) {
                            return "Please fill With a valid Email Address";
                          }
                          return null;
                        },
                        initialValue: signInController.userEmailAddress,
                        decoration: InputDecoration(
                          hintText: 'Your Email',
                          errorMaxLines: 2,
                          prefixIcon: Icon(Icons.email, color: AppColors.kLine),
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
                      ),
                      const SizedBox(height: 20),
                      GetBuilder<SignInController>(
                        builder: (contx) => TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: contx.showPassword,
                          onSaved: (userpass) {
                            signInController.userPassword = userpass;
                          },
                          onChanged: (userpass) {
                            signInController.userPassword = userpass.trim();
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please fill in the password";
                            }
                            if (value.length > 20) {
                              return "The password cannot exceed 20 characters";
                            }
                            if (value.length < 8) {
                              return "The password cannot contain less than 8 characters";
                            }
                            return null;
                          },
                          initialValue: signInController.userPassword,
                          decoration: InputDecoration(
                            hintText: 'Your Password',
                            errorMaxLines: 2,
                            prefixIcon:
                                Icon(Icons.lock, color: AppColors.kLine),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  contx.invertShowPassword();
                                },
                                icon: contx.showPassword
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off)),
                            suffixIconColor: AppColors.kPrimary,
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
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
          
                                 TextButton(
                            onPressed: () {
                              Get.toNamed("SignUp");
                            },
                            style:
                                TextButton.styleFrom(padding: EdgeInsets.zero),
                            child: Text(
                             "Forgot Password ?",
                              style: TextStyle(
                                  color: AppColors.kPrimary, fontSize: 14),
                            ),
                          )

                              

                                 
                        ],
                      ),
                      // const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          if (signInController.formKey.currentState!
                              .validate()) {
                            signInController.formKey.currentState!.save();
                            signInController.signInAUser();
                          }
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
                              "Sign In",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already a member?',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.kPrimary,
                              )),
                          TextButton(
                            onPressed: () {
                              Get.toNamed("SignUp");
                            },
                            style:
                                TextButton.styleFrom(padding: EdgeInsets.zero),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: AppColors.kPrimary, fontSize: 14),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
