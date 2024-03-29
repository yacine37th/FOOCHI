import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluter_ecom/controller/home_controller.dart';
import 'package:fluter_ecom/controller/home_screen_controller.dart';
import 'package:fluter_ecom/theme/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../functions/functions.dart';
import '../main.dart';
import '../theme/colors.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController homeScreenController = Get.find();
    HomeController homeController = Get.find();
    return Scaffold(
      // backgroundColor: AppColors.kBackground,
      body: Stack(
        children: [
          // const BackgroundImage(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                decoration: BoxDecoration(
                  color: lightBlueColor,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.kPrimary),
                  //  Border.all(color: Colors.red)
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 75,
                            height: 75,
                            child: CircleAvatar(
                              backgroundColor:
                                  MainFunctions.generatePresizedColor(
                                      currentUserInfos.name!.length),
                              child: Text(
                                currentUserInfos.name![0].toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 35, color: blackColor),
                              ),
                            )
                            // : CircleAvatar(
                            //     backgroundImage: NetworkImage(
                            //         currentUserInfos.currentUserImageURL!),
                            //   ),
                            ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(currentUserInfos.name!,
                            style: const TextStyle(
                                fontSize: 20,
                                color: blackColor,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${currentUser?.email}",
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      child: TextButton.icon(
                          style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all(blackColor),
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.purple.withOpacity(0.5))),
                          icon: const Icon(Icons.favorite_border_outlined),
                          onPressed: () {
                            // Get.toNamed("/MyTrips");
                            homeScreenController.switchBetweenScreens(1);
                          },
                          label: const Text("My favorites",
                              style: TextStyle(
                                fontSize: 20,
                              ))),
                    ),
                    // const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      child: TextButton.icon(
                          style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all(blackColor),
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.cyan.withOpacity(0.5))),
                          icon: const Icon(Icons.pin_drop_outlined),
                          onPressed: () async {
                            // Get.toNamed("/MyTransmitterTrips");
                            // if (currentUserInfos.latitude != 0 &&
                            //     currentUserInfos.longitude != 0) {
                              MainFunctions.getUserCurrentLocation()
                                  .then((value) {
                                print(value.latitude);
                                print(value.longitude);
                                Get.toNamed("/CurrentPosition", arguments: {
                                  'arg1': value.latitude,
                                  'arg2': value.longitude
                                });
                              });
                            // }
                          },
                          label: const Text("My Position",
                              style: TextStyle(
                                fontSize: 20,
                              ))),
                    ),
                    // const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      child: TextButton.icon(
                          style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all(blackColor),
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.red.withOpacity(0.5))),
                          icon: const Icon(Icons.logout),
                          onPressed: () {
                            homeController.signOutOfAnExistingAccount();
                            // await FirebaseAuth.instance.signOut().then((value) {
                            //   currentUser = null;

                            //   Get.offAllNamed("/SignIn");
                            // });
                          },
                          label: const Text("Sign Out",
                              style: TextStyle(
                                fontSize: 20,
                              ))),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
