import 'package:fluter_ecom/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
  final controller02 = ValueNotifier<bool>(false);
  Map<String, UserModel> usersRef = {};

  getUsers() async {
    await FirebaseFirestore.instance
        .collection("users")
        .get()
        .then((value) async {
      for (int index = 0; index < value.docs.length; index++) {
        usersRef.addAll({
          value.docs[index].id: UserModel(
              uID: value.docs[index].id,
              email: value.docs[index]["userEmail"],
              name: value.docs[index]["userName"])
        });
      }
    });
    print("users /////////////////////////////");
    update();
  }

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }
}
