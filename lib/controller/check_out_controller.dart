import 'package:fluter_ecom/view/infos_page_for_checkoutpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
  final formKey = GlobalKey<FormState>();

  int currentStep = 0;
  bool isCompleted = false;
  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text(
            "Address",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          content: Center(
            child: Text("Day"),
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Text(
            "Complete",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          content: Center(),
        ),
      ];
}
