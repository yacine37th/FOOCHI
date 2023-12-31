import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluter_ecom/controller/pdf/FileHandleApi.dart';
import 'package:fluter_ecom/functions/functions.dart';
import 'package:fluter_ecom/main.dart';
import 'package:fluter_ecom/model/carte_model.dart';
import 'package:fluter_ecom/model/food_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


import 'pdf/PdfInvoiceApi.dart';

class CarteController extends GetxController {
  Map<String, CarteModel> orederList = {};
  var total = 0; ///// total of the carte
  Future getCarteFood() async {
    await FirebaseFirestore.instance
        .collection("carte")
        .where("carteUserID", isEqualTo: currentUserInfos.uID)
        .where("carteFoodIsConfirm", isEqualTo: false)
        .get()
        .then((value) async {
      for (int index = 0; index < value.docs.length; index++) {
        // print(value.docs[index]["carteFoodID"]);
        var doc = await FirebaseFirestore.instance
            .collection("food")
            .doc(value.docs[index]["carteFoodID"])
            .get();
        total += doc["foodPrice"] * value.docs[index]["carteFoodQte"]
            as int; /////// calculate the total of the carte
        orederList.addAll({
          doc.id: CarteModel(
              id: value.docs[index]["carteID"],
              qte: value.docs[index]["carteFoodQte"],
              userID: value.docs[index]["carteUserID"],
              isConfirm: value.docs[index]["carteFoodIsConfirm"],
              imageUrl: doc["foodImage"],
              foodPrice: doc["foodPrice"],
              foodName: doc["foodName"],
              foodID: value.docs[index]["carteFoodID"])
        });
      }
    });
    print("1");

    // print(total);
    update();
  }

  Future deleteFromCarte(var food, CarteModel fo) async {
    orederList.remove(food);
    total -= fo.foodPrice * fo.qte;
    update();
  }

  checkoutCarte(Map<String, CarteModel> list) async {
    // Get.defaultDialog(
    //     onWillPop: () {
    //       return Future.value();
    //     },
    //     barrierDismissible: false,
    //     title: "Please wait",
    //     content: const CircularProgressIndicator());
    List<List<String>> listOfLists = [];
    // print(list.values.elementAt(1).foodName);
    for (var i = 0; i < list.length; i++) {
      // await FirebaseFirestore.instance
      //     .collection("carte")
      //     .doc(list.values.elementAt(i).id)
      //     .update({
      //   "carteFoodIsConfirm": true,
      // });
      // var doc = FirebaseFirestore.instance.collection("oreder").doc();
      // await doc.set({
      //   "orderID": doc.id,
      //   "orderIsConfirm": false,
      //   "orderQte": list.values.elementAt(i).qte,
      //   "orderTotalPrice":
      //       list.values.elementAt(i).foodPrice * list.values.elementAt(i).qte,
      //   "orderUserID": list.values.elementAt(i).userID,
      //   "orderFoodList":
      //       FieldValue.arrayUnion([list.values.elementAt(i).foodID]),
      //   "orderUserName": currentUserInfos.name,
      // });
      print("list[i]");
      // print(list.values.elementAt(i).foodName);
      List<String> newList = [
        "${list.values.elementAt(i).foodName}",
        "${list.values.elementAt(i).qte}",
        "\$${list.values.elementAt(i).foodPrice}",
        "\$${list.values.elementAt(i).foodPrice * list.values.elementAt(i).qte}"
      ];
      listOfLists.add(newList);
    }
    // Get.back();
    // MainFunctions.successSnackBar("Success");
//////Generate INVOICE
    final pdfFile = await PdfInvoiceApi.generate(total, listOfLists);
    // opening the pdf file
    FileHandleApi.openFile(pdfFile);
    print(pdfFile);
    // orederList.clear();
    // total = 0;
    update();
  }

  @override
  void onInit() {
    getCarteFood();
    super.onInit();
  }
}
