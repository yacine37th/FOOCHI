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
      backgroundColor: AppColors.kBackground,
      body: SafeArea(
        child: ListView(physics: BouncingScrollPhysics(), children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                FoodPicture(
                    foodPicUrl:
                        "${foodDetailsController.singleFood.image}"), //url
                Container(
                  margin: EdgeInsets.only(top: screenHeight! * 0.35),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 10,
                            offset: Offset(0, -1))
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        Container(
                          width: screenWidth! / 3.43,
      
                          /// 120.0
                          height: screenHeight! / 227.67,
      
                          /// 3.0
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black12),
                        ),
                        SizedBox(
                          height: screenHeight! / 34.15,
                        ),
      
                        /// 20.0
                        FoodName(
                          foodName: '${foodDetailsController.singleFood.name}',
                          foodPrice:foodDetailsController.singleFood.price,
                        ),
      
                        Stars(),
                        FoodDescription(),
                        // FeaturesFood(),
                        // IncreaseDecrease(food: widget.food),
      
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight! / 45.54),
      
                          /// 15.0
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: screenHeight / 68.3,
                                    bottom: screenHeight / 34.15),
      
                                /// 10.0 - 20.0
                                child: MySeparator(
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "Total",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: screenHeight! / 42.69),
                              ),
      
                              /// 16
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "\$${int.parse("${foodDetailsController.singleFood.price}") * foodDetailsController.counter}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: screenHeight / 27.32),
                                      )
      
                                      /// 25
                                    ],
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            // _decreaseCart();
                                            foodDetailsController.decreaseCart();
                                          },
                                          child: Container(
                                            height: screenHeight / 13.94,
      
                                            /// 49.0
                                            width: screenWidth / 8.39,
      
                                            /// 49.0
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.yellow, width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.red,
                                              // Colors.red.withOpacity(0.1),
                                              //borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: Center(
                                              child: Icon(Icons.remove,
                                                  color: Colors.yellow),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: screenWidth / 6.85,
      
                                          /// 60.0
                                          height: screenHeight / 13.94,
      
                                          /// 49.0
                                          child: Center(
                                            child: Text(
                                              "${foodDetailsController.counter}",
                                              style: TextStyle(
                                                  fontSize: screenHeight / 37.95,
                                                  fontWeight: FontWeight.bold),
                                            ),
      
                                            /// 18
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // _increaseCart();
                                            foodDetailsController.increaseCart();
                                          },
                                          child: Container(
                                            height: screenHeight / 13.94,
      
                                            /// 49.0
                                            width: screenWidth / 8.39,
      
                                            /// 49.0
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.yellow, width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.red,
                                              // Colors.red.withOpacity(0.4),
                                            ),
                                            child: Center(
                                              child: Icon(Icons.add,
                                                  color: Colors.yellow),
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
                              color: Colors.amber,
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
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.transparent),
                                shadowColor:
                                    MaterialStateProperty.all(Colors.transparent),
                              ),
                              onPressed: () {},
                              child: Wrap(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: screenWidth / 51.38),
      
                                    /// 8.0
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
