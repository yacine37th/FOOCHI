import 'package:fluter_ecom/controller/favoris_page_controller.dart';
import 'package:fluter_ecom/utils/favoris_page_bondings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/main_colors.dart';

class FavorisPage extends StatelessWidget {
  const FavorisPage({super.key});

  @override
  Widget build(BuildContext context) {
    FavorisPageController favorisPageController = Get.find();
    double screenWidth(BuildContext context) {
      return MediaQuery.of(context).size.width;
    }

    return Scaffold(
      backgroundColor: AppColors.kBackground,
      appBar: AppBar(
        title: const Text(
          "Favorites",
          style: TextStyle(color: AppColors.kPrimary),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu)),
        elevation: 0,
        backgroundColor: AppColors.kBackground,
        iconTheme: IconThemeData(color: Colors.black),
        bottom: PreferredSize(
            preferredSize: Size(0, 0),
            child: Container(
              color: AppColors.kPrimary,
              height: 1,
            )),
      ),
      // body: Text("dede"),
      body: GetBuilder<FavorisPageController>(builder: (contx) {
        if (contx.favorisFood.isEmpty) {
          return const Center(
            child: Text("List Empty",style: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),),
          );
        } else {
          return GridView.builder(
            physics: BouncingScrollPhysics(),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: contx.favorisFood.length,
            padding: EdgeInsets.all(2.0),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed('/FoodDetails', arguments: {
                    "0": contx.favorisFood.values.elementAt(index)
                  });
                },
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    width: (screenWidth(context) / 2) - 15,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      image: DecorationImage(
                        image: NetworkImage(
                            "${contx.favorisFood.values.elementAt(index).image}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          gradient: new LinearGradient(
                              colors: [
                                Colors.black,
                                const Color(0x19000000),
                              ],
                              begin: const FractionalOffset(0.0, 1.0),
                              end: const FractionalOffset(0.0, 0.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "${contx.favorisFood.values.elementAt(index).name}",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              Text(
                                'Rs. ${contx.favorisFood.values.elementAt(index).price}',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ), /* add child content here */
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
