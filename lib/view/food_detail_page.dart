import 'package:fluter_ecom/controller/food_details_controller.dart';
import 'package:fluter_ecom/theme/main_colors.dart';
import 'package:fluter_ecom/view/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodDetailPage extends StatelessWidget {
  const FoodDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    FoodDetailsController foodDetailsController = Get.find();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: ListView(physics: BouncingScrollPhysics(), children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                FoodPicture(
                    foodPicUrl:
                        "${foodDetailsController.singleFood.image}"), //url
                Container(
                  margin: EdgeInsets.only(top: screenHeight * 0.3),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0)),
                    // boxShadow: [
                    //   BoxShadow(
                    //       color: Colors.black54,
                    //       blurRadius: 10,
                    //       offset: Offset(0, -1)
                    //       )
                    // ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        Container(
                          width: screenWidth / 3.43,
                          height: screenHeight / 227.67,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black12),
                        ),
                        SizedBox(
                          height: screenHeight / 34.15,
                        ),
                        FoodName(
                          foodName: '${foodDetailsController.singleFood.name}',
                          foodPrice: foodDetailsController.singleFood.price,
                        ),
                        Stars(),
                        FoodDescription(),
                        // FeaturesFood(),
                        // IncreaseDecrease(food: widget.food),
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight / 45.54),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: screenHeight / 68.3,
                                    bottom: screenHeight / 34.15),
                                child: const MySeparator(
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "Total",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: screenHeight / 42.69),
                              ),

                              /// 16
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GetBuilder<FoodDetailsController>(
                                        builder: (contx) => Text(
                                          "\$${int.parse("${contx.singleFood.price}") * contx.counter}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: screenHeight / 27.32),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            foodDetailsController
                                                .decreaseCart();
                                          },
                                          child: Container(
                                            height: screenHeight / 13.94,
                                            width: screenWidth / 8.39,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AppColors.kBackground,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: AppColors.kPrimary,
                                            ),
                                            child: Center(
                                              child: Icon(Icons.remove,
                                                  color: AppColors.whiteColor),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: screenWidth / 6.85,
                                          height: screenHeight / 13.94,
                                          child: Center(
                                            child: GetBuilder<
                                                FoodDetailsController>(
                                              builder: (contx) => Text(
                                                "${contx.counter}",
                                                style: TextStyle(
                                                    fontSize:
                                                        screenHeight / 37.95,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // _increaseCart();
                                            foodDetailsController
                                                .increaseCart();
                                          },
                                          child: Container(
                                            height: screenHeight / 13.94,
                                            width: screenWidth / 8.39,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AppColors.kBackground,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: AppColors.kPrimary,
                                            ),
                                            child: Center(
                                              child: Icon(Icons.add,
                                                  color: AppColors.whiteColor),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // AddToCartButton(),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            screenWidth / 20.55,
                            screenHeight / 34.15,
                            screenWidth / 20.55,
                            0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.kPrimary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(Size(
                                    screenWidth / 1.37, screenHeight / 11.66)),
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.kPrimary),
                                // shadowColor: MaterialStateProperty.all(
                                //     Colors.transparent),
                              ),
                              onPressed: () {
                                foodDetailsController.addToCart(
                                    '${foodDetailsController.singleFood.uID}',
                                    foodDetailsController.singleFood);
                              },
                              child: Wrap(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: screenWidth / 51.38),
                                    child: Icon(
                                      Icons.shopping_cart_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Add to Cart",
                                    style: TextStyle(
                                      fontSize: screenHeight / 34.15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // DetailWidget(
                //   food: widget.food,
                // ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
