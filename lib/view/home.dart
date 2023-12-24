import 'package:fluter_ecom/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/main_colors.dart';
import 'widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> categories = ["Pizza", "Burgers", "Kebab", "Desert", "Salad"];
  List<dynamic> foods = [
    {
      "image": "assets/images/one.jpg",
      "isFavorite": false,
    },
    {
      "image": "assets/images/two.jpg",
      "isFavorite": false,
    },
    {
      "image": "assets/images/three.jpg",
      "isFavorite": false,
    }
  ];
  @override
  void initState() {
    // TODO: implement initState
    print(currentUser);
    super.initState();
  }

  int selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      drawer: Container(
        width: 250,
        child: Drawer(
          backgroundColor: Color.fromARGB(255, 28, 28, 28),
          child: Column(children: [
            const SizedBox(height: 20),
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
                // homeScreenController.signOutOfAnExistingAccount();
              },
            ),
            // ListTile(
            //   tileColor: transparentColor,
            //   textColor: whiteColor,
            //   iconColor: whiteColor,
            //   visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            //   contentPadding:
            //       const EdgeInsets.symmetric(vertical: 0.0, horizontal: 14.0),
            //   horizontalTitleGap: 1,
            //   dense: true,
            //   title: const Text(
            //     "الرئيسية",
            //     style: TextStyle(
            //         fontSize: 19,
            //         fontWeight: FontWeight.w300,
            //         fontFamily: 'Cairo'),
            //   ),
            //   leading: ImageIcon(Svg("assets/icons/home_icon.svg")),
            //   onTap: () {
            //     homeScreenController.switchBetweenScreens(0);
            //     Get.back();
            //   },
            // ),
            // ListTile(
            //   tileColor: transparentColor,
            //   textColor: whiteColor,
            //   iconColor: whiteColor,
            //   visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            //   contentPadding:
            //       const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            //   horizontalTitleGap: 1,
            //   dense: true,
            //   onTap: () {
            //     homeScreenController.switchBetweenScreens(1);
            //     Get.back();
            //   },
            //   title: const Text(
            //     "التصنيفات",
            //     style: TextStyle(
            //         fontSize: 19,
            //         fontWeight: FontWeight.w300,
            //         fontFamily: 'Cairo'),
            //   ),
            //   leading: const ImageIcon(Svg("assets/icons/category_icon.svg")),
            // ), //////////////////

            // //////////////////
            // ListTile(
            //   tileColor: transparentColor,
            //   textColor: whiteColor,
            //   iconColor: whiteColor,
            //   visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            //   contentPadding:
            //       const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            //   horizontalTitleGap: 1,
            //   dense: true,
            //   title: const Text(
            //     "الصفحة الشخصية",
            //     style: TextStyle(
            //         fontSize: 19,
            //         fontWeight: FontWeight.w300,
            //         fontFamily: 'Cairo'),
            //   ),
            //   leading: const ImageIcon(Svg("assets/icons/myaccount_icon.svg")),
            //   onTap: () {
            //     homeScreenController.switchBetweenScreens(2);
            //     Get.back();
            //   },
            // ),

            // ListTile(
            //   tileColor: transparentColor,
            //   textColor: whiteColor,
            //   iconColor: whiteColor,
            //   visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            //   contentPadding:
            //       const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            //   horizontalTitleGap: 1,
            //   dense: true,
            //   onTap: () {
            //     Get.toNamed("/RequestedBooks", arguments: {
            //       "0": AppBarType.maktabati,
            //       "1": maktabatiController.maktabati
            //     });
            //   },
            //   title: const Text(
            //     "مكتبتي",
            //     style: TextStyle(
            //         fontSize: 19,
            //         fontWeight: FontWeight.w300,
            //         fontFamily: 'Cairo'),
            //   ),
            //   leading: const ImageIcon(Svg("assets/icons/maktabati_icon.svg")),
            // ),
            // //////////////////

            // const ListTile(
            //   tileColor: transparentColor,
            //   textColor: whiteColor,
            //   iconColor: whiteColor,
            //   visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            //   contentPadding:
            //       EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            //   horizontalTitleGap: 1,
            //   dense: true,
            //   title: Text(
            //     "مكتبتي",
            //     style: TextStyle(fontSize: 19, fontWeight: FontWeight.w300),
            //   ),
            //   leading: Icon(Icons.account_circle_outlined),
            // ),
            //////////////////
            // const ListTile(
            //   tileColor: transparentColor,
            //   textColor: whiteColor,
            //   iconColor: whiteColor,
            //   visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            //   contentPadding:
            //       EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            //   horizontalTitleGap: 1,
            //   dense: true,
            //   title: Text(
            //     "كيف احصل على كتابي ؟",
            //     style: TextStyle(fontSize: 19, fontWeight: FontWeight.w300),
            //   ),
            //   leading: Icon(Icons.info_outline),
            // ),

            //////////////////
            /////////////
            const Spacer(),
          ]),
        ),
      ),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: AppColors.kBackground,
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_basket,
                  color: Colors.grey[800],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 45,
                  height: 50,
                  child: ProfilePicture(),
                ),
              ),
            ],
          ),
          // Text(
          //   "${currentUserInfos.name}",
          //   style: TextStyle(color: Colors.black),
          // ),
          // Padding(
          //   padding: EdgeInsets.fromLTRB(5, 20, 5, 5),
          //   child: Container(
          //     width: 50,
          //     height: 50,
          //     child: ProfilePicture(),
          //   ),
          //   // Text(
          //   //   "${currentUserInfos.firstName!} ${currentUserInfos.lastName!}",
          //   //   style: TextStyle(color: whiteColor),
          //   // ),
          // ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Foochi Food',
                    style: TextStyle(
                        color: Colors.grey[80],
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) => makeCategory(
                            title: categories[index], index: index)),
                    // child: ListView(
                    //   scrollDirection: Axis.horizontal,
                    //   children: <Widget>[
                    //     FadeAnimation(1, makeCategory(title: 'Pizaa')),
                    //     FadeAnimation(1.3, makeCategory(title: 'Burgers')),
                    //     FadeAnimation(1.4, makeCategory(title: 'Kebab')),
                    //     FadeAnimation(1.5, makeCategory(title: 'Desert')),
                    //     FadeAnimation(1.6, makeCategory(title: 'Salad')),
                    //   ],
                    // ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Free Delivery',
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: foods.length,
                    itemBuilder: (context, index) => makeItem(
                        image: foods[index]["image"],
                        isFavorite: foods[index]["isFavorite"],
                        index: index)),
                // child: ListView(
                //   scrollDirection: Axis.horizontal,
                //   children: <Widget>[
                //     FadeAnimation(1.4, makeItem(image: 'assets/images/one.jpg')),
                //     FadeAnimation(1.5, makeItem(image: 'assets/images/two.jpg')),
                //     FadeAnimation(1.6, makeItem(image: 'assets/images/three.jpg')),
                //   ],
                // ),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  Widget makeCategory({title, index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = index;
        });
      },
      child: AnimatedContainer(
        width: 120,
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color:
              selectedCategory == index ? Colors.yellow[700] : Colors.grey[300],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color:
                    selectedCategory == index ? Colors.black : Colors.grey[700],
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Widget makeItem({image, isFavorite, index}) {
    return AspectRatio(
      aspectRatio: 1 / 1.5,
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              )),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(begin: Alignment.bottomCenter, stops: [
                  .2,
                  .9
                ], colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.3),
                ])),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        foods[index]["isFavorite"] =
                            !foods[index]["isFavorite"];
                      });
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                width: 1.5,
                                color: isFavorite
                                    ? Colors.red
                                    : Colors.transparent,
                              )),
                          child: isFavorite
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                )),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "\$ 15.00",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Vegetarian Pizza",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(
//         // child: Icon(Icons.menu),
//         elevation: 2,
//         surfaceTintColor: Colors.red,
//       ),
//       backgroundColor: AppColors.kBackground,
//       appBar: AppBar(
//         backgroundColor: AppColors.kBackground,
//         elevation: 1,
//         iconTheme: IconThemeData(color: Colors.blue),
//       ),
//       body: Center(
//         child: Text("HOME PAGE"),
//       ),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<String> categories = ["Pizza", "Burgers", "Kebab", "Desert", "Salad"];
//   List<dynamic> foods = [
//     {
//       "image": "assets/images/one.jpg",
//       "isFavorite": false,
//     },
//     {
//       "image": "assets/images/two.jpg",
//       "isFavorite": false,
//     },
//     {
//       "image": "assets/images/three.jpg",
//       "isFavorite": false,
//     }
//   ];

//   int selectedCategory = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       drawer: Drawer(
//         // child: Icon(Icons.menu),
//         elevation: 2,
//         surfaceTintColor: Colors.red,
//       ),
//       //  drawer: Drawer(
//       //   backgroundColor: Color.fromARGB(255, 28, 28, 28),
//       //   child: Column(children: [
//       //     const SizedBox(height: 20),
//       //     Padding(
//       //       padding: EdgeInsets.fromLTRB(5, 20, 5, 5),
//       //       child: Row(children: [
//       //         Container(
//       //           width: 50,
//       //           height: 50,
//       //           child: ProfilePicture(),
//       //         ),
//       //         const SizedBox(width: 5),
//       //         Text(
//       //           "${currentUserInfos.firstName!} ${currentUserInfos.lastName!}",
//       //           style: TextStyle(color: whiteColor),
//       //         ),
//       //       ]),
//       //     ),
//       //     const Divider(
//       //       color: whiteColor,
//       //     ),

//       //     ListTile(
//       //       tileColor: transparentColor,
//       //       textColor: whiteColor,
//       //       iconColor: whiteColor,
//       //       visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
//       //       contentPadding:
//       //           const EdgeInsets.symmetric(vertical: 0.0, horizontal: 14.0),
//       //       horizontalTitleGap: 1,
//       //       dense: true,
//       //       title: const Text(
//       //         "الرئيسية",
//       //         style: TextStyle(
//       //             fontSize: 19,
//       //             fontWeight: FontWeight.w300,
//       //             fontFamily: 'Cairo'),
//       //       ),
//       //       leading: ImageIcon(Svg("assets/icons/home_icon.svg")),
//       //       onTap: () {
//       //         homeScreenController.switchBetweenScreens(0);
//       //         Get.back();
//       //       },
//       //     ),
//       //     ListTile(
//       //       tileColor: transparentColor,
//       //       textColor: whiteColor,
//       //       iconColor: whiteColor,
//       //       visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
//       //       contentPadding:
//       //           const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
//       //       horizontalTitleGap: 1,
//       //       dense: true,
//       //       onTap: () {
//       //         homeScreenController.switchBetweenScreens(1);
//       //         Get.back();
//       //       },
//       //       title: const Text(
//       //         "التصنيفات",
//       //         style: TextStyle(
//       //             fontSize: 19,
//       //             fontWeight: FontWeight.w300,
//       //             fontFamily: 'Cairo'),
//       //       ),
//       //       leading: const ImageIcon(Svg("assets/icons/category_icon.svg")),
//       //     ), //////////////////

//       //     //////////////////
//       //     ListTile(
//       //       tileColor: transparentColor,
//       //       textColor: whiteColor,
//       //       iconColor: whiteColor,
//       //       visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
//       //       contentPadding:
//       //           const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
//       //       horizontalTitleGap: 1,
//       //       dense: true,
//       //       title: const Text(
//       //         "الصفحة الشخصية",
//       //         style: TextStyle(
//       //             fontSize: 19,
//       //             fontWeight: FontWeight.w300,
//       //             fontFamily: 'Cairo'),
//       //       ),
//       //       leading: const ImageIcon(Svg("assets/icons/myaccount_icon.svg")),
//       //       onTap: () {
//       //         homeScreenController.switchBetweenScreens(2);
//       //         Get.back();
//       //       },
//       //     ),

//       //     ListTile(
//       //       tileColor: transparentColor,
//       //       textColor: whiteColor,
//       //       iconColor: whiteColor,
//       //       visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
//       //       contentPadding:
//       //           const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
//       //       horizontalTitleGap: 1,
//       //       dense: true,
//       //       onTap: () {
//       //         Get.toNamed("/RequestedBooks", arguments: {
//       //           "0": AppBarType.maktabati,
//       //           "1": maktabatiController.maktabati
//       //         });
//       //       },
//       //       title: const Text(
//       //         "مكتبتي",
//       //         style: TextStyle(
//       //             fontSize: 19,
//       //             fontWeight: FontWeight.w300,
//       //             fontFamily: 'Cairo'),
//       //       ),
//       //       leading: const ImageIcon(Svg("assets/icons/maktabati_icon.svg")),
//       //     ),
//       //     //////////////////

//       //     // const ListTile(
//       //     //   tileColor: transparentColor,
//       //     //   textColor: whiteColor,
//       //     //   iconColor: whiteColor,
//       //     //   visualDensity: VisualDensity(horizontal: -4, vertical: -4),
//       //     //   contentPadding:
//       //     //       EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
//       //     //   horizontalTitleGap: 1,
//       //     //   dense: true,
//       //     //   title: Text(
//       //     //     "مكتبتي",
//       //     //     style: TextStyle(fontSize: 19, fontWeight: FontWeight.w300),
//       //     //   ),
//       //     //   leading: Icon(Icons.account_circle_outlined),
//       //     // ),
//       //     //////////////////
//       //     // const ListTile(
//       //     //   tileColor: transparentColor,
//       //     //   textColor: whiteColor,
//       //     //   iconColor: whiteColor,
//       //     //   visualDensity: VisualDensity(horizontal: -4, vertical: -4),
//       //     //   contentPadding:
//       //     //       EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
//       //     //   horizontalTitleGap: 1,
//       //     //   dense: true,
//       //     //   title: Text(
//       //     //     "كيف احصل على كتابي ؟",
//       //     //     style: TextStyle(fontSize: 19, fontWeight: FontWeight.w300),
//       //     //   ),
//       //     //   leading: Icon(Icons.info_outline),
//       //     // ),
//       //     ListTileTheme(
//       //       contentPadding:
//       //           const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
//       //       dense: true,
//       //       tileColor: transparentColor,
//       //       horizontalTitleGap: -7,
//       //       child: ExpansionTile(
//       //         collapsedIconColor: whiteColor,
//       //         collapsedTextColor: whiteColor,
//       //         leading: const ImageIcon(
//       //             Svg("assets/icons/message_question_icon.svg")),
//       //         //   textColor: whiteColor,
//       //         tilePadding:
//       //             const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),

//       //         title: const Text(
//       //           "كيف احصل على كتابي ؟",
//       //           style: TextStyle(
//       //               fontSize: 19,
//       //               fontWeight: FontWeight.w300,
//       //               fontFamily: 'Cairo'),
//       //         ),
//       //         children: [
//       //           InkWell(
//       //             onTap: () {
//       //               homeScreenController.switchBetweenScreens(3);
//       //               Get.back();
//       //             },
//       //             child: Container(
//       //               padding: const EdgeInsets.only(right: 20),
//       //               child: const ListTile(
//       //                 onTap: null,
//       //                 tileColor: transparentColor,
//       //                 textColor: whiteColor,
//       //                 iconColor: whiteColor,
//       //                 visualDensity:
//       //                     VisualDensity(horizontal: -4, vertical: -4),
//       //                 contentPadding:
//       //                     EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
//       //                 horizontalTitleGap: 1,
//       //                 dense: true,
//       //                 title: Text(
//       //                   "إشتراك ورق ماكس",
//       //                   style: TextStyle(
//       //                       fontSize: 17,
//       //                       fontWeight: FontWeight.w300,
//       //                       fontFamily: 'Cairo'),
//       //                 ),
//       //                 leading:
//       //                     ImageIcon(Svg("assets/icons/thunder_outer_icon.svg")),
//       //               ),
//       //             ),
//       //           ),
//       //           InkWell(
//       //             onTap: () {
//       //               Get.defaultDialog(
//       //                   title: "",
//       //                   content: Column(
//       //                     children: [
//       //                       const Text(
//       //                         "يمكن طلب نسخة الكترونية أو ورقية للكتاب االذي ترغب بقراءته",
//       //                         style: TextStyle(
//       //                             fontFamily: 'Cairo', color: blackColor),
//       //                       ),
//       //                       const SizedBox(height: 20),
//       //                       TextButton(
//       //                         onPressed: () {
//       //                           navigator!.pop();
//       //                         },
//       //                         child: const Text(
//       //                           "حسنا",
//       //                           style: TextStyle(fontFamily: 'Cairo'),
//       //                         ),
//       //                       )
//       //                     ],
//       //                   ));
//       //             },
//       //             child: Container(
//       //               padding: const EdgeInsets.only(right: 20),
//       //               child: const ListTile(
//       //                 onTap: null,
//       //                 tileColor: transparentColor,
//       //                 textColor: whiteColor,
//       //                 iconColor: whiteColor,
//       //                 visualDensity:
//       //                     VisualDensity(horizontal: -4, vertical: -4),
//       //                 contentPadding:
//       //                     EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
//       //                 horizontalTitleGap: 1,
//       //                 dense: true,
//       //                 title: Text(
//       //                   "شراء نسخة ورقية أو إلكترونية",
//       //                   style: TextStyle(
//       //                       fontSize: 17,
//       //                       fontWeight: FontWeight.w300,
//       //                       fontFamily: 'Cairo'),
//       //                 ),
//       //                 leading: ImageIcon(Svg("assets/icons/money_icon.svg")),
//       //               ),
//       //             ),
//       //           ),
//       //           const SizedBox(height: 10)
//       //         ],
//       //       ),
//       //     ),
//       //     //////////////////
//       //     ListTile(
//       //       tileColor: transparentColor,
//       //       textColor: whiteColor,
//       //       iconColor: whiteColor,
//       //       visualDensity: VisualDensity(horizontal: -4, vertical: -4),
//       //       contentPadding:
//       //           const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
//       //       horizontalTitleGap: 1,
//       //       dense: true,
//       //       title: const Text(
//       //         "تسجيل الخروج",
//       //         style: TextStyle(
//       //             fontSize: 19,
//       //             fontWeight: FontWeight.w300,
//       //             fontFamily: 'Cairo'),
//       //       ),
//       //       leading: const ImageIcon(Svg("assets/icons/logout_icon.svg")),
//       //       onTap: () {
//       //         homeScreenController.signOutOfAnExistingAccount();
//       //       },
//       //     ),
//       //     /////////////
//       //     const Spacer(),
//       //     ListTile(
//       //       tileColor: transparentColor,
//       //       textColor: whiteColor,
//       //       iconColor: whiteColor,
//       //       visualDensity: VisualDensity(horizontal: -4, vertical: -4),
//       //       contentPadding:
//       //           const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
//       //       horizontalTitleGap: 1,
//       //       dense: true,
//       //       title: const Text(
//       //         "تعرف على ورق",
//       //         style: TextStyle(
//       //             fontSize: 19,
//       //             fontWeight: FontWeight.w300,
//       //             fontFamily: 'Cairo'),
//       //       ),
//       //       leading: const ImageIcon(Svg("assets/icons/info_circle_icon.svg")),
//       //       onTap: () {
//       //         homeScreenController.knowWarak();
//       //       },
//       //     ),
//       //     ListTile(
//       //       tileColor: transparentColor,
//       //       textColor: whiteColor,
//       //       iconColor: whiteColor,
//       //       visualDensity: VisualDensity(horizontal: -4, vertical: -4),
//       //       contentPadding:
//       //           const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
//       //       horizontalTitleGap: 1,
//       //       dense: true,
//       //       title: const Text(
//       //         "سياسة الخصوصية",
//       //         style: TextStyle(
//       //             fontSize: 19,
//       //             fontWeight: FontWeight.w300,
//       //             fontFamily: 'Cairo'),
//       //       ),
//       //       leading: const ImageIcon(Svg("assets/icons/lock.svg")),
//       //       onTap: () {
//       //         homeScreenController.privatePolicy();
//       //       },
//       //     ),
//       //     const SizedBox(height: 20),
//       //   ]),
//       // ),

//       appBar: AppBar(
//         backgroundColor: Colors.grey[100],
//         iconTheme: IconThemeData(color: Colors.blue),

//         elevation: 0,
//         // brightness: Brightness.light,
//         leading: Icon(null),
//         actions: <Widget>[
//           IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.shopping_basket,
//               color: Colors.grey[800],
//             ),
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     'Food Delivery',
//                     style: TextStyle(
//                         color: Colors.grey[80],
//                         fontWeight: FontWeight.bold,
//                         fontSize: 30),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     height: 50,
//                     child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: categories.length,
//                         itemBuilder: (context, index) => makeCategory(
//                             title: categories[index], index: index)),
//                     // child: ListView(
//                     //   scrollDirection: Axis.horizontal,
//                     //   children: <Widget>[
//                     //     FadeAnimation(1, makeCategory(title: 'Pizaa')),
//                     //     FadeAnimation(1.3, makeCategory(title: 'Burgers')),
//                     //     FadeAnimation(1.4, makeCategory(title: 'Kebab')),
//                     //     FadeAnimation(1.5, makeCategory(title: 'Desert')),
//                     //     FadeAnimation(1.6, makeCategory(title: 'Salad')),
//                     //   ],
//                     // ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(20),
//               child: Text(
//                 'Free Delivery',
//                 style: TextStyle(
//                     color: Colors.grey[700],
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.0),
//                 child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: foods.length,
//                     itemBuilder: (context, index) => makeItem(
//                         image: foods[index]["image"],
//                         isFavorite: foods[index]["isFavorite"],
//                         index: index)),
//                 // child: ListView(
//                 //   scrollDirection: Axis.horizontal,
//                 //   children: <Widget>[
//                 //     FadeAnimation(1.4, makeItem(image: 'assets/images/one.jpg')),
//                 //     FadeAnimation(1.5, makeItem(image: 'assets/images/two.jpg')),
//                 //     FadeAnimation(1.6, makeItem(image: 'assets/images/three.jpg')),
//                 //   ],
//                 // ),
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget makeCategory({title, index}) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedCategory = index;
//         });
//       },
//       child: AnimatedContainer(
//         width: 120,
//         duration: Duration(milliseconds: 300),
//         margin: EdgeInsets.only(right: 10),
//         decoration: BoxDecoration(
//           color:
//               selectedCategory == index ? Colors.yellow[700] : Colors.grey[300],
//           borderRadius: BorderRadius.circular(50),
//         ),
//         child: Center(
//           child: Text(
//             title,
//             style: TextStyle(
//                 color:
//                     selectedCategory == index ? Colors.black : Colors.grey[700],
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget makeItem({image, isFavorite, index}) {
//     return AspectRatio(
//       aspectRatio: 1 / 1.5,
//       child: GestureDetector(
//         child: Container(
//           margin: EdgeInsets.only(right: 20),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               image: DecorationImage(
//                 image: AssetImage(image),
//                 fit: BoxFit.cover,
//               )),
//           child: Container(
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 gradient: LinearGradient(begin: Alignment.bottomCenter, stops: [
//                   .2,
//                   .9
//                 ], colors: [
//                   Colors.black.withOpacity(.9),
//                   Colors.black.withOpacity(.3),
//                 ])),
//             child: Padding(
//               padding: EdgeInsets.all(20.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         foods[index]["isFavorite"] =
//                             !foods[index]["isFavorite"];
//                       });
//                     },
//                     child: Align(
//                       alignment: Alignment.topRight,
//                       child: AnimatedContainer(
//                           duration: Duration(milliseconds: 300),
//                           padding: EdgeInsets.all(5),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               border: Border.all(
//                                 width: 1.5,
//                                 color: isFavorite
//                                     ? Colors.red
//                                     : Colors.transparent,
//                               )),
//                           child: isFavorite
//                               ? Icon(
//                                   Icons.favorite,
//                                   color: Colors.red,
//                                 )
//                               : Icon(
//                                   Icons.favorite,
//                                   color: Colors.white,
//                                 )),
//                     ),
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         "\$ 15.00",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 40,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "Vegetarian Pizza",
//                         style: TextStyle(color: Colors.white, fontSize: 20),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
