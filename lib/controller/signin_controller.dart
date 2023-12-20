import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final formKey = GlobalKey<FormState>();
  bool showPassword = true;

  String? userEmailAddress;
  String? userPassword;

  invertShowPassword() {
    showPassword = !showPassword;
    update();
  }

  signInAUser() async {
    Get.defaultDialog(
        onWillPop: () {
          return Future.value();
        },
        barrierDismissible: false,
        title: "S'il vous plaît, attendez",
        content: const CircularProgressIndicator());
    try {
      print(userEmailAddress);
      print(userPassword);
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userEmailAddress!, password: userPassword!);
      print("credential");
      print(credential);
      // currentUser = FirebaseAuth.instance.currentUser;

      // var queries = await FirebaseFirestore.instance
      //     .collection("Users")
      //     .doc(currentUser!.uid)
      //     .collection("MyTrips")
      //     .get();
      // queries.docs.forEach((element) {
      //   myTripsUIDs.add(element.id);
      // });

      // myTripsUIDs.forEach((element) async {
      //   var temp = await FirebaseFirestore.instance
      //       .collection("Trips")
      //       .doc(element)
      //       .get();
      //   TripModel tripTemp = TripModel(
      //       tripUID: temp["tripUID"],
      //       driverUID: temp["driverUID"],
      //       driverUserName: temp["driverUserName"],
      //       departure: temp["departure"],
      //       destination: temp["destination"],
      //       tripDate: temp["tripDate"],
      //       price: temp["price"],
      //       condition: temp["condition"],
      //       allSeats: temp["allSeats"],
      //       seatsLeft: temp["seatsLeft"]);
      //   tempMyTrips.add(tripTemp);
      // });
      // List<TripModel> tempMyTransmitterTrips = [];
      // List<String> myTransmitterTripsUIDs = [];

      // var queries1 = await FirebaseFirestore.instance
      //     .collection("Users")
      //     .doc(currentUser!.uid)
      //     .collection("MyTrips")
      //     .get();
      // queries1.docs.forEach((element) {
      //   myTransmitterTripsUIDs.add(element.id);
      // });

      // myTransmitterTripsUIDs.forEach((element) async {
      //   var temp = await FirebaseFirestore.instance
      //       .collection("Trips")
      //       .doc(element)
      //       .get();
      //   TripModel tripTemp = TripModel(
      //       tripUID: temp["tripUID"],
      //       driverUID: temp["driverUID"],
      //       driverUserName: temp["driverUserName"],
      //       departure: temp["departure"],
      //       destination: temp["destination"],
      //       tripDate: temp["tripDate"],
      //       price: temp["price"],
      //       condition: temp["condition"],
      //       allSeats: temp["allSeats"],
      //       seatsLeft: temp["seatsLeft"]);
      //   tempMyTransmitterTrips.add(tripTemp);
      // });

      // await MainFunctions.getcurrentUserInfos();
      print("doneeee");
      Get.back();
      // Get.offAndToNamed("/");
      if (credential.user!.emailVerified) {
        Get.offAndToNamed("/");
      } else {
        Get.toNamed("/EmailVerification");
      }
    } on FirebaseAuthException catch (e) {
      Get.back();
      print(e);
      if (e.code == 'user-not-found') {
        Get.defaultDialog(
          title: "Compte non trouvé",
          content: const Icon(
            Icons.report_problem,
            color: Colors.red,
          ),
          onConfirm: () {
            Get.back();
          },
        );
      } else if (e.code == 'wrong-password') {
        Get.defaultDialog(
          title: "Veuillez vérifier votre mot de passe",
          content: const Icon(
            Icons.report_problem,
            color: Colors.red,
          ),
          onConfirm: () {
            Get.back();
          },
        );
      }
      // else {
      //   print("///////");
      //   Get.defaultDialog(
      //     title: "Quelque chose ne va pas",
      //     content: const Icon(
      //       Icons.report_problem,
      //       color: Colors.red,
      //     ),
      //     onConfirm: () {
      //       Get.back();
      //     },
      //   );
      // }
    } catch (e) {
      Get.back();
      Get.defaultDialog(
        title: "Quelque chose ne va pas",
        content: const Icon(
          Icons.report_problem,
          color: Colors.red,
        ),
        onConfirm: () {
          Get.back();
        },
      );
    }
  }
}
