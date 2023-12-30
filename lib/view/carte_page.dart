import 'package:fluter_ecom/controller/carte_controller.dart';
import 'package:fluter_ecom/theme/main_colors.dart';
import 'package:fluter_ecom/view/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartePage extends StatelessWidget {
  const CartePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    CarteController carteController = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "My Cart",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth / 20),
        child: GetBuilder<CarteController>(
          builder: (contx) => ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: contx.orederList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight / 68.3),
                  child: Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      // setState(() {});
                    },
                    background: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth / 20.55),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE6E6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Row(
                        children: [Spacer(), Icon(Icons.delete_outline)],
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(4, 6),
                              blurRadius: 4,
                              color: Colors.black.withOpacity(0.1),
                            )
                          ]),
                      child: Row(
                        children: [
                          Container(
                            height: screenHeight / 8.54,

                            /// 80.0
                            width: screenWidth / 4.57,

                            /// 90.0
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "${contx.orederList.values.elementAt(index).imageUrl}"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          SizedBox(width: screenWidth / 20.55),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${contx.orederList.values.elementAt(index).foodName}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenHeight / 42.69),
                                maxLines: 2,
                              ),
                              SizedBox(height: screenHeight / 341.5),
                              Text.rich(
                                TextSpan(
                                  text:
                                      "\$${contx.orederList.values.elementAt(index).foodPrice}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.kPrimary,
                                      fontSize: screenHeight / 37.95

                                      /// 18
                                      ),
                                  children: [
                                    TextSpan(
                                        text:
                                            " x ${contx.orederList.values.elementAt(index).qte}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // FoodText(
                          //     foodName: food.foodName,
                          //     foodPrice: food.foodPrice),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   SnackBar(
                                //     content: Text("Delete {widget.foodName}?"),
                                //     action: SnackBarAction(label: "Yes", onPressed: () {}),
                                //   ),
                                // );
                              },
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.black54,
                              )),

                          // DeleteIconButton(foodName: food.foodName),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight / 15.0,
          horizontal: screenHeight / 30.0,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: screenHeight / 85.37),
                child: const MySeparator(
                  color: Colors.grey,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                      height: screenHeight / 22.77,
                      width: screenWidth / 13.7,
                      child: const Icon(Icons.receipt_long_outlined,
                          color: AppColors.kPrimary)),
                  const Spacer(),
                  const Text(
                    "Payment ",
                  ),
                  SizedBox(width: screenWidth / 41.1),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: screenHeight / 56.92,
                    color: Colors.black26,
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight / 45.54,
              ),
              SizedBox(
                height: screenHeight / 45.54,
              ),
              Row(
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.black54),
                  ),
                  const Spacer(),
                  Text(
                    "\$ ${carteController.total}",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: screenHeight / 45.54,
                        color: Colors.black54),
                  ),
                ],
              ),
              SizedBox(height: screenHeight / 34.15),
              GestureDetector(
                onTap: () {
                  carteController.orederList.forEach((key, value) {
                    print(key);
                    print(value.qte);
                  }); 
                  // if (signInController.formKey.currentState!
                  //     .validate()) {
                  //   signInController.formKey.currentState!.save();
                  //   signInController.signInAUser();
                  // }
                },
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Container(
                    height: 55,
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: AppColors.kPrimary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Checkout",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),

              // InkWell(
              //   onTap: () {
              //     // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckoutPageView()));
              //   },
              //   focusColor: Colors.red,
              //   hoverColor: Colors.yellow,
              //   splashColor: Colors.amberAccent,
              //   overlayColor: MaterialStatePropertyAll(
              //       Color(Color.getAlphaFromOpacity(0.9))),
              //   child: Container(
              //       width: screenWidth / 1.02,
              //       height: screenHeight / 12.42,
              //       decoration: BoxDecoration(
              //           color: Colors.red,
              //           borderRadius: BorderRadius.circular(30)),
              //       child: Center(
              //           child: Text(
              //         "Checkout",
              //         style: TextStyle(
              //             color: Colors.white,
              //             fontSize: screenHeight / 34.15,
              //             fontWeight: FontWeight.bold),
              //       ))),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
