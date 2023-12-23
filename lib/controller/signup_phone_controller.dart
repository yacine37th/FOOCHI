import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneSignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  String countryCode = "+213";
  String? userPhoneNumber ;


 registerWithPhoneNumber() async {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    // Step 1: Request to verify the phone number
    await _auth.verifyPhoneNumber(
      phoneNumber: countryCode+userPhoneNumber!,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // This callback will be triggered automatically in some situations,
        // for example, when the phone number is already verified,
        // or if you are using a testing phone number (see Firebase console).
        // You can handle the automatic verification here.
        // For example, sign in the user (credential) automatically.
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle verification failure
        print("Verification failed: ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Save the verification ID for later use
        String smsCode = ''; // You can manually enter the code for testing purposes
        // For a real application, you would usually send this code to the user
        // and ask them to enter it manually or implement a code auto-retrieval flow.
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: smsCode,
        );

        // Step 2: Sign in the user with the verification code
        await _auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-retrieval timeout
        print("Code auto-retrieval timed out");
      },
    );
  } catch (e) {
    print("Error during phone number registration: $e");
  }
}
}
