import 'package:dots_indicator/dots_indicator.dart';
import 'package:fluter_ecom/controller/foochi_onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/main_colors.dart';
////////////// INDICATORS DOWNN
class CustomIndicator extends StatelessWidget {
  final int position;
  const CustomIndicator({required this.position, super.key});

  @override
  Widget build(BuildContext context) {
    FoochiOnboardingController foochiOnboardingController = Get.find();
    return DotsIndicator(
      dotsCount: foochiOnboardingController.onboardingList.length,
      position: position,
      decorator: DotsDecorator(
        color: Colors.grey.withOpacity(0.5),
        size: const Size.square(8.0),
        activeSize: const Size(20.0, 8.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        activeColor: AppColors.kPrimary,
      ),
    );
  }
}