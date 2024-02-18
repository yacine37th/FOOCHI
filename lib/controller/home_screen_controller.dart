import 'package:fluter_ecom/controller/carte_controller.dart';
import 'package:fluter_ecom/controller/favoris_page_controller.dart';
import 'package:fluter_ecom/controller/home_controller.dart';
import 'package:fluter_ecom/view/carte_page.dart';
import 'package:fluter_ecom/view/favoris_page.dart';
import 'package:fluter_ecom/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../functions/functions.dart';
import '../theme/themes.dart';
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
    FavorisPage(),
    CartePage(),
    Profil(),

    // Tasnifat(),
    // MyAccount(),
    // MaxSubscription()
  ];
  @override
  onInit() async {
    update();
    Get.put(HomeController());
    Get.put(FavorisPageController());
    Get.put(CarteController());

    // Get.put(MaktabatiController()); //account controller
    // Get.put(MaxSubscriptionController());

    super.onInit();
  }

   set() async {
    bool isDarkMode =
        MainFunctions.sharredPrefs!.getBool("isDarkTheme") ?? false;
    print(isDarkMode);
    print("///////////////////////////////");
    print(MainFunctions.sharredPrefs!.getBool("isDarkTheme"));

    if (isDarkMode) {
      Get.changeTheme(Themes.customLightTheme);
      MainFunctions.sharredPrefs!.setBool("isDarkTheme", false);
      await Get.forceAppUpdate();
    } else {
      Get.changeTheme(Themes.customDarkTheme);
      MainFunctions.sharredPrefs!.setBool("isDarkTheme", true);
      await Get.forceAppUpdate();
    }

    update();
  }
}
