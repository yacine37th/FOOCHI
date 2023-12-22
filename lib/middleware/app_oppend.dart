import 'package:fluter_ecom/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppIsOppen extends GetMiddleware {
  @override
  int? get priority => 2;
  @override
  RouteSettings? redirect(String? route) {
    if (isUserLoggedIn) {
      //  MainFunctions.getcurrentUserInfos();
      // MainFunctions.loadTripsDriversData();
      return const RouteSettings(name: "/SignIn");
    } else {
      return null;
    }
  }
}
