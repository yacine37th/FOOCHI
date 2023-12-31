import 'package:fluter_ecom/controller/check_out_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
   Widget build(BuildContext context) {
        double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    CheckOutController checkOutController = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Checkout", style: TextStyle(color: Colors.red, fontSize: 22, fontWeight: FontWeight.bold ),),
        elevation: 0,
      ),
      body: 
      Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(primary: Colors.red)
        ),
        child: Stepper(
          type: StepperType.vertical,
          steps: checkOutController.getSteps(),
          currentStep: checkOutController.currentStep,
          onStepContinue: (){
            final isLastStep = checkOutController.currentStep == checkOutController.getSteps().length - 1;
            if (isLastStep) {
              // setState(() => isCompleted = true);
              checkOutController.isCompleted =true;
              print("Completed");
              /// send data to server
            } else {
              /// code
            }
            // setState(() => currentStep += 1);
                          checkOutController.currentStep +=1;

          },
          onStepTapped: (step) =>checkOutController.currentStep=step,
          //  setState(() => currentStep = step),
          onStepCancel:
          checkOutController.currentStep == 0 ? null : (){
            // setState(() => currentStep -= 1);
            checkOutController.currentStep-=1;
          },
          controlsBuilder: (BuildContext context, ControlsDetails controls){
            final isLastStep = checkOutController.currentStep == checkOutController.getSteps().length -1;
            return Container(
              margin: EdgeInsets.only(top: screenHeight!/68.3),        /// 10.0
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap:controls.onStepContinue,
                      child: Container(
                        height: screenHeight!/13.66,                   /// 50.0
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: Center(child: Text(isLastStep ? "Confirm" : "Next", style: TextStyle(color: Colors.white, fontSize: screenHeight!/37.95, fontWeight: FontWeight.bold),),),
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth!/34.25,),                /// 12.0
                  if(checkOutController.currentStep != 0)
                    Expanded(
                      child: InkWell(
                        onTap:controls.onStepCancel,
                        child: Container(
                          height: screenHeight!/13.66,                /// 50.0
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          child: Center(child: Text("Back", style: TextStyle(color: Colors.white, fontSize: screenHeight!/37.95, fontWeight: FontWeight.bold),),),   /// 18
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        )
      )
    );
  }
}