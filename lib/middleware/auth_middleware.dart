import 'package:fluter_ecom/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    if (currentUser != null && currentUser!.emailVerified) {
      //  MainFunctions.getcurrentUserInfos();
      // MainFunctions.loadTripsDriversData();
      return const RouteSettings(name: "/");
    } else {
      return null;
    }
  }
}
