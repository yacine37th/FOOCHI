import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  // late AnimationController animationController;
  // final Tween<double> tween = Tween<double>(begin: 1.0, end: 0.95);
  // final Duration animationDuration = const Duration(milliseconds: 300);




  bool showPassword = true;

  String? userEmailAddress;
  String? userPassword;

  invertShowPassword() {
    showPassword = !showPassword;
    update();
  }

  createNewUser() async {
    Get.defaultDialog(
        title: "S'il vous plaît, attendez",
        content: const CircularProgressIndicator());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userEmailAddress!,
        password: userPassword!,
      );

      FirebaseFirestore.instance
          .collection("users")
          .doc(credential.user!.uid)
          .set({
        "userID": credential.user!.uid,
        "userEmail": userEmailAddress,
      });
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();
      Get.back();
      Get.toNamed("/EmailVerification");
    } on FirebaseAuthException catch (e) {
      Get.back();

      if (e.code == 'weak-password') {
        Get.defaultDialog(
          title: "Le mot de passe est faible, veuillez le changer",
          content: const Icon(
            Icons.report_problem,
            color: Colors.red,
          ),
          onConfirm: () {
            Get.back();
          },
        );
      } else if (e.code == 'email-already-in-use') {
        Get.defaultDialog(
          title: "Il y a un compte utilisant cette adresse e-mail",
          content: const Icon(
            Icons.report_problem,
            color: Colors.red,
          ),
          onConfirm: () {
            Get.back();
          },
        );
      }
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
