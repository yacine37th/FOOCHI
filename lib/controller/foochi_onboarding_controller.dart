import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/Onboarding.dart';
import '../theme/assets.dart';

class FoochiOnboardingController extends GetxController {
  final Future<SharedPreferences> sahredPrefs = SharedPreferences.getInstance();

  PageController pageController = PageController();
  int currentIndex = 0;
  void setNewIndex(value) {
    currentIndex = value;
    update();
    update();
  }

  List<Onboarding> onboardingList = [
    Onboarding(
        title1: 'Diverse ',
        title2: 'and fresh food',
        description:
            'With an extensive menu prepared by talented chefs, fresh quality food.',
        image: AppAssets.kOnboardingFirst),
    Onboarding(
        title1: 'Easy to ',
        title2: 'change dish ingredients',
        description:
            'You are a foodie, you can add or subtract ingredients in the dish.',
        image: AppAssets.kOnboardingSecond),
    Onboarding(
        title1: 'Delivery ',
        title2: 'Is given on time',
        description:
            'With an extensive menu prepared by talented chefs, fresh quality food.',
        image: AppAssets.kOnboardingThird)
  ];



  @override
  void onInit() {
    // TODO: implement onInit

    // checkLoginStatus();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
