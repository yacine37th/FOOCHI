import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluter_ecom/main.dart';
import 'package:fluter_ecom/model/carte_model.dart';
import 'package:get/get.dart';

class CarteController extends GetxController {
  Map<String, CarteModel> orederList = {};
  var total = 0;
  Future getCarteFood() async {
    await FirebaseFirestore.instance
        .collection("carte")
        // .limit(6)
        .where("carteUserID", isEqualTo: currentUserInfos.uID)
        .get()
        .then((value) async {
      for (int index = 0; index < value.docs.length; index++) {
        print(value.docs[index]["carteFoodID"]);
        // DocumentReference documentReference = await FirebaseFirestore.instance
        //     .collection("food")
        //     .doc(value.docs[index].id);
        // await documentReference.get().then((snapshot) {
        //   print(snapshot.data().toString());
        // });
        var doc = await FirebaseFirestore.instance
            .collection("food")
            .doc(value.docs[index]["carteFoodID"])
            .get();
        total += doc["foodPrice"] * value.docs[index]["carteFoodQte"] as int;
        orederList.addAll({
          value.docs[index].id: CarteModel(
              id: value.docs[index].id,
              qte: value.docs[index]["carteFoodQte"],
              userID: value.docs[index]["carteUserID"],
              isConfirm: value.docs[index]["carteFoodIsConfirm"],
              imageUrl: doc["foodImage"],
              foodPrice: doc["foodPrice"],
              foodName: doc["foodName"])
        });
        // for (var i = 0; i < orederList.length; i++) {
        //   // total += orederList[i]!.foodPrice! * orederList[i]!.qte!;
        //   print(orederList[i]);
        // }
      }
    });
    print("1");

    // print(total);
    update();
  }

  @override
  void onInit() {
    getCarteFood();
    super.onInit();
  }
}
