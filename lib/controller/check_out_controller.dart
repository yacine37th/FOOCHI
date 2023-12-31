import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
    int currentStep = 0;
  bool isCompleted = false;
  List<Step> getSteps() => [
    Step(
      state: currentStep> 0 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 0,
      title: Text("Address", style: TextStyle(fontSize: 18,),),
      content: Center(),
    ),
    Step(
        state: currentStep> 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: Text("Complete", style: TextStyle(fontSize: 18,),),
        content: Center(),
    ),
  ];
}