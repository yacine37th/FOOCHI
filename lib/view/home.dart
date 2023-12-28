import 'package:fluter_ecom/controller/home_controller.dart';
import 'package:fluter_ecom/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';

import '../theme/colors.dart';
import '../theme/main_colors.dart';
import 'widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<String> categories = ["Pizza", "Burgers", "Kebab", "Desert", "Salad"];
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
    HomeController homeController = Get.find();
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);

    return Scaffold(
      backgroundColor: AppColors.kBackground,
       appBar: AppBar(
        // elevation: 1,
         leading: IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu)),
        elevation: 0,
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
              SizedBox(
                height: 48,
                width: 48,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      child: ProfilePicture(),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 8,
              )
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
        bottom: PreferredSize(
            preferredSize: Size(0, 0),
            child: Container(
              color: AppColors.kPrimary,
              height: 1,
            )),
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
                    child: GetBuilder<HomeController>(
                      builder: (contx) => contx.categories.isEmpty
                          ? Center(
                              child: CircularProgressIndicator(
                              backgroundColor: AppColors.kBackground,
                              color: AppColors.kOrange,
                            ))
                          : ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: contx.categories.length,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  // setState(() {
                                  //   selectedCategory = index;
                                  // });
                                },
                                child: AnimatedContainer(
                                  width: 120,
                                  duration: Duration(milliseconds: 300),
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    color: selectedCategory == index
                                        ? Colors.yellow[700]
                                        : Colors.grey[300],
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${contx.categories.values.elementAt(index).name}",
                                      style: TextStyle(
                                          color: selectedCategory == index
                                              ? Colors.black
                                              : Colors.grey[700],
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),

                              // makeCategory(
                              //     title: homeController.categories[index],
                              //     index: index)
                            ),
                    ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Free Delivery',
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: GetBuilder<HomeController>(
                      builder: (contx) => TextButton.icon(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(transparentColor),
                              iconColor:
                                  MaterialStateProperty.all(AppColors.kPrimary),
                              overlayColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      AppColors.kPrimary.withOpacity(0.1)),
                              foregroundColor: MaterialStateProperty.all(
                                  AppColors.kPrimary)),
                          onPressed: () {
                            Get.toNamed("/MoreFood", arguments: {
                              // "0": AppBarType.mostRecentBooks,
                              "0": homeController.foods,
                            });
                          },
                          icon: const Text("See more",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'Cairo Bold',
                              )),
                          label: const Icon(
                            Icons.arrow_forward_ios,
                            size: 19,
                          ))

                      //  TextButton(
                      //   style: ButtonStyle(
                      //     // backgroundColor: MaterialStateProperty.all(Colors.red),
                      //   // animationDuration: Duration(milliseconds: 1000),
                      //   // overlayColor: MaterialStatePropertyAll( AppColors.kPrimary),
                      //   // textStyle: MaterialStatePropertyAll(MaterialStateTextStyle.resolveWith((states) => )),

                      //           // backgroundColor: MaterialStateProperty.all(
                      //           //   // contx.isPressed ? Colors.blue : null,
                      //           // ),
                      //           // foregroundColor: MaterialStateProperty.all(
                      //           //   contx.isPressed ? Colors.white : Colors.black,
                      //           // ),

                      //   ),
                      //   onPressed: (){
                      //     contx.isPressed = !contx.isPressed ;
                      //   },
                      //   child: Text("See more",style: TextStyle(color: AppColors.kPrimary),),
                      //   // 'Free Delivery',
                      //   // style: TextStyle(
                      //   //     color: Colors.grey[700],
                      //   //     fontSize: 20,
                      //   //     fontWeight: FontWeight.bold),
                      // ),

                      ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: GetBuilder<HomeController>(
                  builder: (contx) => ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: contx.foods.length,
                      itemBuilder: (context, index) => AspectRatio(
                            aspectRatio: 1 / 1.5,
                            child: GestureDetector(
                              // onTap: (){
                              //   print(contx.foods.values.elementAt(index).name);
                              // },
                              child: Container(
                                margin: EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "${contx.foods.values.elementAt(index).image}",
                                      ),
                                      fit: BoxFit.cover,
                                    )),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          stops: [
                                            .2,
                                            .9
                                          ],
                                          colors: [
                                            Colors.black.withOpacity(.9),
                                            Colors.black.withOpacity(.3),
                                          ])),
                                  child: Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        GetBuilder<HomeController>(
                                          builder: (contx) => GestureDetector(
                                            onTap: () {
                                              if (currentUserInfos.foodFavoris
                                                  .contains(homeController
                                                      .foods.values
                                                      .elementAt(index)
                                                      .uID)) {
                                                homeController.removeFromFavoris(
                                                    "${homeController.foods.values.elementAt(index).uID}");
                                              } else {
                                                homeController.addToFavoris(
                                                    "${homeController.foods.values.elementAt(index).uID}");
                                              }
                                            },
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      border: Border.all(
                                                        width: 1.5,
                                                        color: currentUserInfos
                                                                .foodFavoris
                                                                .contains(
                                                                    homeController
                                                                        .foods
                                                                        .values
                                                                        .elementAt(
                                                                            index)
                                                                        .uID)
                                                            ? Colors.red
                                                            : Colors
                                                                .transparent,
                                                      )),
                                                  child: currentUserInfos
                                                          .foodFavoris
                                                          .contains(
                                                              homeController
                                                                  .foods.values
                                                                  .elementAt(
                                                                      index)
                                                                  .uID)
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
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "\$ ${contx.foods.values.elementAt(index).price}.00",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "${contx.foods.values.elementAt(index).name}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                      //  makeItem(
                      //     image: foods[index]["image"],
                      //     isFavorite: foods[index]["isFavorite"],
                      //     index: index)

                      ),
                ),
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

//  GetBuilder<HomeController>(
//       builder: (contx) => contx.usersRef.isEmpty
//           ? CircularProgressIndicator()
//           : ListView.builder(
//               itemCount: contx.usersRef.length,
//               itemBuilder: (context, index) {
//                 return Row(children: [
//                   Text("${contx.usersRef.values.elementAt(index).name}"),
//                   SizedBox(
//                     width: 15,
//                     // height: 15,
//                   ),
//                   Text("${contx.usersRef.values.elementAt(index).email}"),
//                   // Text("${homeController.usersRef.values.elementAt(index).uID}")
//                 ]);
//               },
//             ),
//     ),

Color generatePresizedColor(int namelength) {
  return profilColors[((namelength - 3) % 8).floor()];
}
