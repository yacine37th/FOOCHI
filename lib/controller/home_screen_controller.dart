import 'package:fluter_ecom/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/home_bindings.dart';
import '../view/home.dart';

class HomeScreenController extends GetxController {
  int _currentBottomBarIndex = 0;

  int currentBottomBarIndex() {
    return _currentBottomBarIndex;
  }

  switchBetweenScreens(index) async {
    _currentBottomBarIndex = index;
    if (index == 0) {
      _currentBottomBarIndex = index;
    }
    if (index == 1) {
      _currentBottomBarIndex = index;

      // Apis.getFirebaseMessagingToken();
    }
    if (index == 2) {
      _currentBottomBarIndex = index;
    }
    update();
  }

  List<Widget> bottomNavigationBarScreensList = [
    Home(),
    Home(),
    Home(),
    Home(),
    // Tasnifat(),
    // MyAccount(),
    // MaxSubscription()
  ];
  @override
  onInit() async {
    update();
    Get.put(HomeController());
    // Get.put(TasnifatController());
    // Get.put(MaktabatiController()); //account controller
    // Get.put(MaxSubscriptionController());

    super.onInit();
  }
}
