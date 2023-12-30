import 'package:fluter_ecom/view/widgets.dart';
import 'package:flutter/material.dart';

class CartePage extends StatelessWidget {
  const CartePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Cart",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth / 20),
        child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              // var food = foodList?[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight / 68.3),

                /// 10.0
                child: Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    // setState(() {});
                  },
                  background: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth / 20.55),

                    /// 20.0
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [Spacer(), Icon(Icons.delete_outline)],
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(4, 6),
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
                              image: NetworkImage("foodImage}"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),

                        SizedBox(width: screenWidth / 20.55),

                        /// 20.0
                        ///
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "{widget.foodName}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenHeight / 42.69),

                              /// 16
                              maxLines: 2,
                            ),
                            SizedBox(height: screenHeight / 341.5),

                            /// 2.0
                            Text.rich(
                              TextSpan(
                                text: "\${widget.foodPrice}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red,
                                    fontSize: screenHeight / 37.95

                                    /// 18
                                    ),
                                children: [
                                  TextSpan(
                                      text: " x 1",
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
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   SnackBar(
                              //     content: Text("Delete {widget.foodName}?"),
                              //     action: SnackBarAction(label: "Yes", onPressed: () {}),
                              //   ),
                              // );
                            },
                            icon: Icon(
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

        //  FutureBuilder<List<Food>>(
        //   future: bringTheFoods(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       var foodList = snapshot.data;
        //       return
        //           }

        //     else{
        //       return SizedBox(
        //           child: Center(
        //             child:Text('edded')
        //             //  Lottie.network("https://assets10.lottiefiles.com/packages/lf20_peztuj79.json",
        //             //     height: screenHeight/6.83,      /// 100.0
        //             //     width: screenWidth/4.11,        /// 100.0
        //             //     repeat: false),
        //           )
        //       );
        //     }
        //     // },
        //   },

        // ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight / 15.0,
          horizontal: screenHeight / 30.0,
        ),
        // height: 174,
        decoration: BoxDecoration(
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

                /// 8.0
                child: MySeparator(
                  color: Colors.grey,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                      height: screenHeight / 22.77,
                      width: screenWidth / 13.7,
                      child:
                          Icon(Icons.receipt_long_outlined, color: Colors.red)),
                  Spacer(),
                  Text(
                    "Payment with 3D secure",
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

              /// 15.0
              /// Row(
     Row(
      children: [
        Text(
          "Subtotal",
          style: TextStyle(
              fontWeight:  FontWeight.w400,
              fontSize:screenHeight / 45.54,
              color: Colors.black54),
        ),
        Spacer(),
        Text(
         "\$37.0",
          style: TextStyle(
              fontWeight:  FontWeight.w400,
              fontSize:screenHeight / 45.54,
              color: Colors.black54),
        ),
      ],
    ),
 
 
              // BottomBarText(
              //     title_text: "Subtotal",
              //     price_text: "\$37.0",
              //     font_size: screenHeight / 45.54,
              //     fontWeight: FontWeight.w400,
              //     text_color: Colors.black54),

              /// 15
              // SizedBox(
              //   height: screenHeight / 45.54,
              // ),
              // BottomBarText(
              //   title_text: "Discount",
              //   price_text: "\$2.0",
              //   font_size: screenHeight / 45.54,
              //   fontWeight: FontWeight.w400,
              //   text_color: Colors.black54,
              // ),
              SizedBox(
                height: screenHeight / 45.54,
              ),
               Row(
      children: [
        Text(
          "Total",
          style: TextStyle(
              fontWeight:  FontWeight.w400,
              fontSize:screenHeight / 45.54,
              color: Colors.black54),
        ),
        Spacer(),
        Text(
         "\$35.0",
          style: TextStyle(
              fontWeight:  FontWeight.w400,
              fontSize:screenHeight / 45.54,
              color: Colors.black54),
        ),
      ],
    ),
              // BottomBarText(
              //   title_text: "Total",
              //   price_text: "\$35.0",
              //   font_size: screenHeight / 37.95,
              //   fontWeight: FontWeight.bold,
              //   text_color: Colors.black,
              // ),

              /// 18
              SizedBox(height: screenHeight / 34.15),

              /// 20.0
              // CheckoutButton(),
              InkWell(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckoutPageView()));
      },
      child: Container(
          width: screenWidth! / 1.02,

        
          height: screenHeight! / 12.42,

          /// 55.0
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(30)),
          child: Center(
              child: Text(
            "Checkout",
            style: TextStyle(
                color: Colors.white,
                fontSize: screenHeight! / 34.15,
                fontWeight: FontWeight.bold),

            /// 20.0
          ))),
    ),
 
            ],
          ),
        ),
      ),
    );
  }
}
