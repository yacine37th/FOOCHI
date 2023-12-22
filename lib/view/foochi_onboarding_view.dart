import 'package:dots_indicator/dots_indicator.dart';
import 'package:fluter_ecom/controller/foochi_onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../animation/OnBoardingCard.dart';
import '../animation/custom_animated_button.dart';
import '../animation/custom_indicator.dart';
import '../theme/main_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoochiOnboardingView extends StatelessWidget {
  const FoochiOnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark));
    FoochiOnboardingController foochiOnboardingController = Get.find();
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Expanded(
              flex: 3,
              child: PageView.builder(
                itemCount: foochiOnboardingController.onboardingList.length,
                controller: foochiOnboardingController.pageController,
                onPageChanged: (value) {
                  // setState(() {
                  //   currentIndex = value;
                  // });
                  // foochiOnboardingController.setNewIndex(value);

                  foochiOnboardingController.pageController.addListener(() {
                    foochiOnboardingController.setNewIndex(value);
                  });
                },
                itemBuilder: (context, index) {
                  return OnBoardingCard(
                    index: index,
                    onBoarding:
                        foochiOnboardingController.onboardingList[index],
                  );
                },
              ),
            ),
            // CustomIndicator(position: foochiOnboardingController.currentIndex),
            GetBuilder<FoochiOnboardingController>(
              builder: (contx) => DotsIndicator(
                dotsCount: contx.onboardingList.length,
                position: contx.currentIndex,
                decorator: DotsDecorator(
                  color: Colors.grey.withOpacity(0.5),
                  size: const Size.square(8.0),
                  activeSize: const Size(20.0, 8.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  activeColor: AppColors.kPrimary,
                ),
              ),
            ),
            const SizedBox(height: 83),
            GetBuilder<FoochiOnboardingController>(
              builder: (contx) => CustomOutlinedButton(
                width: 130,
                onTap: () async {
                  if (contx.currentIndex == (contx.onboardingList.length - 1)) {
                    final SharedPreferences prefs = await contx.sahredPrefs;
                    prefs.setBool("appIsOppen", true);
                    print("Last page ");
                  } else {
                    print(contx.currentIndex);
                    contx.pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  }
                },
                text: contx.currentIndex == (contx.onboardingList.length - 1)
                    ? 'Get Started'
                    : 'Next',
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
