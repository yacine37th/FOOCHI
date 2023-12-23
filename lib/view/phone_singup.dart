import 'package:fluter_ecom/controller/signup_phone_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../theme/assets.dart';
import '../theme/main_colors.dart';
import 'widgets.dart';

class PhoneSignUp extends StatelessWidget {
  const PhoneSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    PhoneSignUpController phoneSignUpController = Get.find();
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      appBar: AppBar(
        backgroundColor: AppColors.kBackground,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              navigator!.pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColors.kPrimary,
              // size: 18,
            )),
        //        actions: [
        //   Icon(Icons.favorite),
        //   Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 16),
        //     child: Icon(Icons.search),
        //   ),
        //   Icon(Icons.more_vert),
        // ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.kAppLogo,
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We need to register your phone without getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                key: phoneSignUpController.formKey,
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      //  const BorderSide(color: AppColors.kLine),
                      border: Border.all(width: 1, color: AppColors.kLine),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 40,
                        child: TextFormField(
                          initialValue: phoneSignUpController.countryCode,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            fillColor: AppColors.kLine,
                            focusColor: AppColors.kLine,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Text(
                        "|",
                        style: TextStyle(fontSize: 33, color: AppColors.kLine),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child:
                              //      TextFormField(
                              //   textInputAction: TextInputAction.next,
                              //   keyboardType: TextInputType.emailAddress,
                              //   // onSaved: (userEmailAddress) {
                              //   //   phoneSignUpController.userEmailAddress = userEmailAddress;
                              //   // },
                              //   // onChanged: (userEmailAddress) {
                              //   //   phoneSignUpController.userEmailAddress =
                              //   //       userEmailAddress.trim();
                              //   // },
                              //   validator: (val) {
                              //     if (val!.isEmpty) {
                              //       return "Please fill Your Email ";
                              //     }
                              //     if (!RegExp(
                              //             r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                              //         .hasMatch(val)) {
                              //       return "Please fill With a valid Email Address";
                              //     }
                              //     return null;
                              //   },
                              //   decoration: InputDecoration(
                              //     hintText: 'Your Email',
                              //     errorMaxLines: 2,
                              //     contentPadding: const EdgeInsets.symmetric(
                              //         horizontal: 20, vertical: 16),
                              //     enabledBorder: OutlineInputBorder(
                              //       borderSide:
                              //           const BorderSide(color: AppColors.kLine),
                              //       borderRadius: BorderRadius.circular(10),
                              //     ),
                              //     focusedBorder: OutlineInputBorder(
                              //       borderSide:
                              //           const BorderSide(color: AppColors.kOrange),
                              //       borderRadius: BorderRadius.circular(10),
                              //     ),
                              //     border: OutlineInputBorder(
                              //       borderSide:
                              //           const BorderSide(color: AppColors.kLine),
                              //       borderRadius: BorderRadius.circular(10),
                              //     ),
                              //     errorBorder: OutlineInputBorder(
                              //       borderSide:
                              //           const BorderSide(color: AppColors.KError),
                              //       borderRadius: BorderRadius.circular(10),
                              //     ),
                              //     hintStyle: const TextStyle(
                              //         fontSize: 14,
                              //         fontWeight: FontWeight.w300,
                              //         color: Colors.grey),
                              //   ),
                              // ),

                              TextFormField(
                        keyboardType: TextInputType.phone,
                        onSaved: (userPhoneNumber) {
                          phoneSignUpController.userPhoneNumber =
                              userPhoneNumber;
                        },
                        onChanged: (userPhoneNumber) {
                          phoneSignUpController.userPhoneNumber =
                              userPhoneNumber.trim();
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please fill Your Phone Number";
                          }
                          if (RegExp(r"^\d{10}$").hasMatch(val)) {
                            return "Please fill With a valid Phone Number";
                          }
                          return null;
                        },
                        initialValue: phoneSignUpController.userPhoneNumber,
                        // maxLength: 10,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone",
                          hintStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey),
                          //   ),
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              //  GetBuilder<PhoneSignUpController>(
              //          builder: (controller) =>  Row(
              //             mainAxisAlignment: MainAxisAlignment.end,
              //             children: [
              //               Text(
              //                 '${controller.userPhoneNumber?.length}/10',
              //                 style:
              //                     TextStyle(color: Color.fromARGB(255, 7, 6, 6)),
              //               ),
              //             ],
              //           ),
              //         ),

              SizedBox(
                height: 20,
              ),

              GestureDetector(
                onTap: () {
                  if (phoneSignUpController.formKey.currentState!
                      .validate()) {
                    phoneSignUpController.formKey.currentState!.save();
                    phoneSignUpController.registerWithPhoneNumber();
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
                      "Send the code",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),

              //   SizedBox(
              //     width: double.infinity,
              //     height: 45,
              //     child: ElevatedButton(
              //         style: ElevatedButton.styleFrom(
              //             primary: Colors.green.shade600,
              //             shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(10))),
              //         onPressed: () {
              //           // Navigator.pushNamed(context, 'verify');
              //         },
              //         child: Text("Send the code")),
              //   )
            ],
          ),
        ),
      ),
    );
  }
}
