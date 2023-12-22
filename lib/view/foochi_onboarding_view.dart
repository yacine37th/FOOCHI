import 'package:fluter_ecom/controller/foochi_onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../animation/OnBoardingCard.dart';
import '../animation/custom_animated_button.dart';
import '../animation/custom_indicator.dart';
import '../theme/main_colors.dart';

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
                  foochiOnboardingController.setNewIndex(value);
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
            CustomIndicator(position: foochiOnboardingController.currentIndex),
            const SizedBox(height: 83),
            CustomOutlinedButton(
              width: 130,
              onTap: () {
                if (foochiOnboardingController.currentIndex ==
                    (foochiOnboardingController.onboardingList.length - 1)) {
                } else {
                  foochiOnboardingController.pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }
              },
              text: foochiOnboardingController.currentIndex ==
                      (foochiOnboardingController.onboardingList.length - 1)
                  ? 'Get Started'
                  : 'Next',
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
