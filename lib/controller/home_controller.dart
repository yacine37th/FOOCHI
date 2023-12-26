import 'package:fluter_ecom/model/category_model.dart';
import 'package:fluter_ecom/model/food_model.dart';
import 'package:fluter_ecom/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
  final controller02 = ValueNotifier<bool>(false);
  Map<String, UserModel> usersRef = {};
  Map<String, CategoryModel> categories = {};
  Map<String, FoodModel> foods = {};
  bool isPressed = false;
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

  getCategories() async {
    await FirebaseFirestore.instance
        .collection("categories")
        .get()
        .then((value) async {
      for (int index = 0; index < value.docs.length; index++) {
        categories.addAll({
          value.docs[index].id: CategoryModel(
              uID: value.docs[index].id,
              name: value.docs[index]["categoryName"])
        });
      }
    });
  }

  getFood() async {
    await FirebaseFirestore.instance
        .collection("food")
        .limit(2)
        .get()
        .then((value) async {
      for (int index = 0; index < value.docs.length; index++) {
        foods.addAll({
          value.docs[index].id: FoodModel(
              uID: value.docs[index].id,
              name: value.docs[index]["foodName"],
              price: value.docs[index]["foodPrice"],
              image: value.docs[index]["foodImage"])
        });
      }
    });
  }

  @override
  void onInit() {
    getUsers();
    getCategories();
    getFood();
    super.onInit();
  }
}
