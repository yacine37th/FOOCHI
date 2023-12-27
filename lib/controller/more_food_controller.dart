import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/food_model.dart';

class MoreFoodController extends GetxController {
  Map<String, FoodModel> foods = Get.arguments["0"];
  getRequestedBooks() async {
    isFetching = true;
    await FirebaseFirestore.instance
        .collection("food")
        // .orderBy("bookDateAdded", descending: true)
        .startAfterDocument(await FirebaseFirestore.instance
            .collection("food")
            .doc(foods.values.last.uID)
            .get())
        .limit(9)
        .get()
        .then((value) {
      if (value.docs.isEmpty) {
        getMore = false;
        print("*******dddddd***********");
      } 
      for (int index = 0; index < value.docs.length; index++) {
        foods.addAll({
          value.docs[index].id: FoodModel(
              uID: value.docs[index].id,
              name: value.docs[index]["foodName"],
              price: value.docs[index]["foodPrice"],
              image: value.docs[index]["foodImage"])
        });
      }
      // print("AppBarType.mostRecentBooks");
    });

    isFetching = false;

    update();
  }

  var getMore = true;
  var isFetching = false;
  void _scrollListener() async {
    print("******************");
    if (getMore) {
      if (scrollController?.position.pixels ==
              scrollController?.position.maxScrollExtent &&
          isFetching == false) {
        isFetching = true;
        await getRequestedBooks();
        isFetching = false;
      }
    }
  }

  ScrollController? scrollController;
  @override
  // TODO: implement onStart
  InternalFinalCallback<void> get onStart {
    print(Get.arguments);
    return super.onStart;
  }

  @override
  void onInit() {
    scrollController = ScrollController()..addListener(_scrollListener);

    getRequestedBooks();
    print(foods.length);

    super.onInit();
  }
}
