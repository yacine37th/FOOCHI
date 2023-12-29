import 'package:fluter_ecom/theme/main_colors.dart';
import 'package:fluter_ecom/view/home.dart';
import 'package:fluter_ecom/view/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../controller/home_controller.dart';
import '../controller/home_screen_controller.dart';
import '../main.dart';
import '../theme/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<BottomNavigationBarItem> bottomNavigationBarItemList = [
  //   const BottomNavigationBarItem(
  //     label: "الرئيسية",
  //     icon: Icon(Icons.home),
  //     // activeIcon: ActiveBottomBarIcon(
  //     //   widgetIcon: ImageIcon(Svg("assets/icons/home_icon.svg")),
  //     // ),
  //   ),
  //   const BottomNavigationBarItem(
  //     label: "الرئيسية",
  //     icon: Icon(Icons.home),
  //     // activeIcon: ActiveBottomBarIcon(
  //     //   widgetIcon: ImageIcon(Svg("assets/icons/home_icon.svg")),
  //     // ),
  //   ),
  //   const BottomNavigationBarItem(
  //     label: "الرئيسية",
  //     icon: Icon(Icons.home),
  //     // activeIcon: ActiveBottomBarIcon(
  //     //   widgetIcon: ImageIcon(Svg("assets/icons/home_icon.svg")),
  //     // ),
  //   ),
  //   const BottomNavigationBarItem(
  //     label: "الرئيسية",
  //     icon: Icon(Icons.home),
  //     // activeIcon: ActiveBottomBarIcon(
  //     //   widgetIcon: ImageIcon(Svg("assets/icons/home_icon.svg")),
  //     // ),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    HomeScreenController homeScreenController = Get.find();
    HomeController homeController = Get.find();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 28, 28, 28),
        child: Column(children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GetBuilder<HomeController>(
                  builder: (contx) => AdvancedSwitch(
                    activeChild: Icon(Icons.dark_mode),
                    inactiveChild: Icon(Icons.sunny),
                    width: 70,
                    controller: homeController.controller02,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 20, 5, 5),
            child: Row(children: [
              Container(
                width: 50,
                height: 50,
                child: ProfilePicture(),
              ),
              const SizedBox(width: 5),
              Text(
                "${currentUserInfos.name!} ",
                style: TextStyle(color: Colors.white),
              ),
            ]),
          ),
          const Divider(
            color: Colors.white,
          ),
          ListTile(
            tileColor: AppColors.transparentColor,
            textColor: AppColors.whiteColor,
            iconColor: AppColors.whiteColor,
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            horizontalTitleGap: 1,
            dense: true,
            title: const Text(
              "Sign Out",
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Cairo'),
            ),
            leading: Icon(Icons.logout),
            onTap: () {
              homeController.signOutOfAnExistingAccount();
            },
          ),
          const Spacer(),
        ]),
      ),

      // appBar: AppBar(),
      // drawer: Drawer(),
      backgroundColor: Colors.white,

      body: GetBuilder<HomeScreenController>(builder: (context) {
        return homeScreenController.bottomNavigationBarScreensList[
            homeScreenController.currentBottomBarIndex()];
      }),
      // bottomNavigationBar: GetBuilder<HomeScreenController>(builder: (context) {
      //   return BottomNavigationBar(
      //     selectedLabelStyle: TextStyle(fontFamily: 'Cairo', color: blackColor),
      //     unselectedLabelStyle: TextStyle(fontFamily: 'Cairo'),
      //     selectedItemColor: orangeColor,
      //     unselectedItemColor: greyColor,
      //     items: bottomNavigationBarItemList,
      //     type: BottomNavigationBarType.shifting,
      //     showSelectedLabels: true,
      //     showUnselectedLabels: true,
      //     selectedIconTheme: IconThemeData(color: whiteColor),
      //     elevation: 0,
      //     currentIndex: homeScreenController.currentBottomBarIndex(),
      //     onTap: (index) {
      //       homeScreenController.switchBetweenScreens(index);
      //     },
      //   );
      // }),

      // body: Center(
      //   child: _widgetOptions.elementAt(_selectedIndex),
      // ),
      bottomNavigationBar: GetBuilder<HomeScreenController>(
        builder: (contx) => Container(
          decoration: BoxDecoration(
            color: AppColors.kBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: AppColors.kPrimary,
                hoverColor: AppColors.kPrimary,
                gap: 8,
                activeColor: AppColors.whiteColor,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: const Color.fromRGBO(132, 189, 147, 1),
                color: AppColors.kSecondary,
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    iconActiveColor: Colors.white,
                    active: true,
                    text: 'Home',
                  ),
                  GButton(
                    icon: LineIcons.heart,
                    text: 'Likes',
                  ),
                  GButton(
                    icon: LineIcons.shoppingCart,
                    text: 'Cart',
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Profil',
                  ),
                ],
                selectedIndex: homeScreenController.currentBottomBarIndex(),
                onTabChange: (index) {
                  homeScreenController.switchBetweenScreens(index);
                  // setState(() {
                  //   _selectedIndex = index;
                  // });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
