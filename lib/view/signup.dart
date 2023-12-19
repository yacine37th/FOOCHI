import 'package:fluter_ecom/theme/main_colors.dart';
import 'package:fluter_ecom/view/social_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../animation/fade_animation.dart';
import '../controller/signup_constroller.dart';
import '../theme/assets.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController signUpController = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kBackground,
      ),
      backgroundColor: AppColors.kBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
   child: Form(
          key: signUpController.formKey,
          child: FadeAnimation(
            delay: 1,
            child: Column(
              children: [
                const SizedBox(height: 80),
                Center(child: Image.asset(AppAssets.kAppLogo)),
                const SizedBox(height: 30),
                const Text('Sign Up',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                const SizedBox(height: 24),




 


                // SocialIconRow(
                //   facebookCallback: () {
                //     debugPrint('Facebook');
                //   },
                //   googleCallback: () {
                //     debugPrint('Google');  
                //   },
                //   twitterCallback: () {
                //     debugPrint('Twitter');
                //   },
                // ),
               
               
                const SizedBox(height: 30),



                
                // AuthField(
                //   controller: _usernameController,
                //   hintText: 'Your Username',
                //   isFieldValidated: isNameCorrect,
                //   keyboardType: TextInputType.name,
                //   onChanged: (value) {
                //     isNameCorrect = validateName(value);
                //     setState(() {});
                //   },
                //   validator: (value) {
                //     if (!validateName(value!)) {
                //       return 'Enter a valid name';
                //     }
                //     return null;
                //   },
                // ),
                // const SizedBox(height: 20),
                // AuthField(
                //   controller: _emailController,
                //   hintText: 'Your Email',
                //   keyboardType: TextInputType.emailAddress,
                //   isFieldValidated: isEmailCorrect,
                //   onChanged: (value) {
                //     setState(() {});
                //     isEmailCorrect = validateEmail(value);
                //   },
                //   validator: (value) {
                //     if (!validateEmail(value!)) {
                //       return 'Please enter a valid email address';
                //     }
                //     return null;
                //   },
                // ),
                // const SizedBox(height: 20),
                // AuthField(
                //   hintText: 'Your Password',
                //   controller: _passwordController,
                //   keyboardType: TextInputType.visiblePassword,
                //   isPasswordField: true,
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter your email';
                //     } else if (value.length < 6) {
                //       return 'Password should be at least 6 characters';
                //     } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*d).+$')
                //         .hasMatch(value)) {
                //       return 'Password should contain at least one uppercase letter, one lowercase letter, and one digit';
                //     }
                //     return null;
                //   },
                // ),
                // const SizedBox(height: 30),
                // PrimaryButton(
                //     onTap: () async {
                //       if (_formKey.currentState!.validate()) {}
                //     },
                //     text: 'Sign Up'),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already a member?',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.kPrimary,
                        )),
                    // CustomTextButton(
                    //   onPressed: () {},
                    //   text: 'Sign In',
                    // )
                  ],
                )
              ],
            ),
          ),
        ),
     
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(vertical: 100),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         Form(
          //           key: signUpController.formKey,
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             // mainAxisSize: MainAxisSize.min,
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Padding(
          //                 padding: const EdgeInsets.symmetric(
          //                     vertical: 10, horizontal: 30),
          //                 child: TextFormField(
          //                   textInputAction: TextInputAction.next,
          //                   keyboardType: TextInputType.emailAddress,
          //                   onSaved: (emailAddress) {
          //                     signUpController.userEmailAddress = emailAddress;
          //                   },
          //                   onChanged: (emailAddress) {
          //                     signUpController.userEmailAddress =
          //                         emailAddress.trim();
          //                   },
          //                   validator: (val) {
          //                     if (val!.isEmpty) {
          //                       return "Email";
          //                     }
          //                     if (!RegExp(
          //                             r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
          //                         .hasMatch(val)) {
          //                       return "Veuillez remplir un email valide";
          //                     }
          //                     return null;
          //                   },
          //                   // initialValue: signUpController.userEmailAddress,
          //                   decoration: const InputDecoration(
          //                     prefixIcon: Icon(Icons.mail_outline_rounded),
          //                     hintStyle: TextStyle(
          //                         fontFamily: 'Cairo', color: Colors.grey),
          //                     hintText: 'Email',
          //                   ),
          //                 ),
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.symmetric(
          //                     vertical: 10, horizontal: 30),
          //                 child: GetBuilder<SignUpController>(
          //                   builder: (cntx) => TextFormField(
          //                     keyboardType: TextInputType.visiblePassword,
          //                     obscureText: cntx.showPassword,
          //                     validator: (value) {
          //                       if (value!.isEmpty) {
          //                         return "Veuillez remplir le mot de passe";
          //                       }
          //                       if (value.length > 20) {
          //                         return "Le mot de passe ne peut pas dépasser 20 caractères";
          //                       }
          //                       if (value.length < 8) {
          //                         return "Le mot de passe ne peut pas contenir moins de 8 caractères";
          //                       }
          //                       return null;
          //                     },
          //                     onSaved: (password) {
          //                       cntx.userPassword = password;
          //                     },
          //                     onChanged: (password) {
          //                       cntx.userPassword = password.trim();
          //                     },
          //                     // initialValue: signUpController.userPassword,
          //                     decoration: InputDecoration(
          //                       prefixIcon: const Icon(Icons.lock),
          //                       hintStyle: TextStyle(
          //                           fontFamily: 'Cairo',
          //                           color:
          //                               const Color.fromARGB(255, 204, 166, 166)),
          //                       suffixIcon: IconButton(
          //                           onPressed: () {
          //                             cntx.invertShowPassword();
          //                           },
          //                           icon: cntx.showPassword
          //                               ? const Icon(Icons.visibility)
          //                               : const Icon(Icons.visibility_off)),
          //                       hintText: 'Mot de passe',
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   Padding(
          //                     padding: const EdgeInsets.symmetric(horizontal: 2),
          //                     child: ElevatedButton(
          //                       style: ButtonStyle(
          //                           // backgroundColor: MaterialStateProperty.all(
          //                           //     Color.fromRGBO(32, 48, 61, 1)),
          //                           //     alignment: Alignment.center
          //                           ),
          //                       onPressed: () {
          //                         if (signUpController.formKey.currentState!
          //                             .validate()) {
          //                           signUpController.formKey.currentState!.save();
          //                           signUpController.createNewUser();
          //                         }
          //                         // print(signUpController.userEmailAddress);
          //                         // print(signUpController.userPassword);
          //                       },
          //                       child: const Text(
          //                         "Register",
          //                         style: TextStyle(
          //                             fontSize: 17, fontFamily: 'Cairo'),
          //                       ),
          //                     ),
          //                   ),
          //                   // Padding(
          //                   //   padding: const EdgeInsets.symmetric(horizontal: 2),
          //                   //   child: TextButton(
          //                   //     style: ButtonStyle(
          //                   //         // backgroundColor: MaterialStateProperty.all(
          //                   //         //     Color.fromRGBO(32, 48, 61, 1)),
          //                   //         //     alignment: Alignment.center

          //                   //         ),
          //                   //     onPressed: () {
          //                   //       // MainFunctions.textDirection =
          //                   //       //                 TextDirection.rtl;
          //                   //       Get.forceAppUpdate();
          //                   //       Get.toNamed("/register");
          //                   //       // Navigator.push(
          //                   //       //   context,
          //                   //       //   MaterialPageRoute(
          //                   //       //       builder: (context) => SignUp()),
          //                   //       // );
          //                   //     },
          //                   //     child: const Text(
          //                   //       "إنشاء حساب",
          //                   //       style: TextStyle(
          //                   //           fontSize: 17, fontFamily: 'Cairo'),
          //                   //     ),
          //                   //   ),
          //                   // ),
          //                 ],
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
        ),
      ),
    );
  }
}
