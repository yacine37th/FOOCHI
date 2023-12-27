import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluter_ecom/controller/more_food_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/main_colors.dart';

class MoreFood extends StatelessWidget {
  const MoreFood({super.key});

  @override
  Widget build(BuildContext context) {
    MoreFoodController moreFoodController = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kBackground,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              navigator!.pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColors.kPrimary,
              // size: 18,
            )),
        //        actions: [
        //   Icon(Icons.favorite),
        //   Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 16),
        //     child: Icon(Icons.search),
        //   ),
        //   Icon(Icons.more_vert),
        // ],
      ),
      backgroundColor: AppColors.kBackground,
      body: GetBuilder<MoreFoodController>(builder: (contx) {
        if (contx.foods.isEmpty) {
          return const Center(
            child: Text("No Food to display"),
          );
        } else {
          return ListView(
            physics: const BouncingScrollPhysics(),
            controller: contx.scrollController,
            children: [
              GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.8,
          ),
               itemCount: contx.foods.length,
               itemBuilder: (context, index) =>Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.network(
                "${contx.foods.values.elementAt(index).image}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${contx.foods.values.elementAt(index).name}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
               )
            ],
            // children: [
            //   GridView.builder(
            //     physics: const NeverScrollableScrollPhysics(),
            //     padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            //     shrinkWrap: true,
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 3,
            //         crossAxisSpacing: 12,
            //         mainAxisSpacing: 12,
            //         childAspectRatio: 0.77
            //         ),
            //     itemCount: contx.foods.length,
            //     itemBuilder: (context, index) {
            //       return InkWell(
            //         onTap: () {
            //           // Get.toNamed("/BookDetails",
            //           //     arguments: requestedBooksController
            //           //         .requestedBooks.values
            //           //         .elementAt(index));
            //         },
            //         child: Container(
            //           decoration: BoxDecoration(
            //               borderRadius:
            //                   const BorderRadius.all(Radius.circular(5)),
            //               border: Border.all(color: AppColors.kPrimary)),
            //           child: ClipRRect(
            //             borderRadius: BorderRadius.circular(5),
            //             child: CachedNetworkImage(
            //               imageUrl:
            //                   "${contx.foods.values.elementAt(index).image}",
            //               fit: BoxFit.cover,
            //               progressIndicatorBuilder:
            //                   (context, child, loadingProgress) {
            //                 return Center(
            //                   child: CircularProgressIndicator(
            //                       value: loadingProgress.progress),
            //                 );
            //               },
            //             ),
            //           ),
            //         ),
            //         //  BookThumnail(
            //         //     url: requestedBooksController.requestedBooks.values
            //         //         .elementAt(index)
            //         //         .thumbnail!),
            //       );
            //     },
            //   ),
            //   Builder(
            //     builder: (context) {
            //       if (moreFoodController.isFetching) {
            //         return Column(
            //           children: const [
            //             SizedBox(height: 60),
            //             Center(child: CircularProgressIndicator()),
            //             SizedBox(height: 60)
            //           ],
            //         );
            //       } else {
            //         return const SizedBox();
            //       }
            //     },
            //   )
            // ],
        
          );

//          ListView.builder(
//           physics: const BouncingScrollPhysics(),
//           controller: contx.scrollController,
//           itemCount: contx.foods.length,
//           itemBuilder: (context, index) => GridView(
//             gridDelegate: null,
//             children: [
//  AspectRatio(
//               aspectRatio: 1 / 1.5,
//               child: GestureDetector(
//                 // onTap: (){
//                 //   print(contx.foods.values.elementAt(index).name);
//                 // },
//                 child: Container(
//                   margin: EdgeInsets.only(right: 20),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       image: DecorationImage(
//                         image: NetworkImage(
//                           "${contx.foods.values.elementAt(index).image}",
//                         ),
//                         fit: BoxFit.cover,
//                       )),
//                   child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         gradient:
//                             LinearGradient(begin: Alignment.bottomCenter, stops: [
//                           .2,
//                           .9
//                         ], colors: [
//                           Colors.black.withOpacity(.9),
//                           Colors.black.withOpacity(.3),
//                         ])),
//                     child: Padding(
//                       padding: EdgeInsets.all(20.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           GestureDetector(
//                             onTap: () {
//                               // setState(() {
//                               //   foods[index]["isFavorite"] =
//                               //       !foods[index]["isFavorite"];
//                               // });
//                             },
//                             child: Align(
//                               alignment: Alignment.topRight,
//                               child: AnimatedContainer(
//                                   duration: Duration(milliseconds: 300),
//                                   padding: EdgeInsets.all(5),
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(12),
//                                       border: Border.all(
//                                         width: 1.5,
//                                         color:
//                                             //  foods[index]
//                                             //         ["isFavorite"]
//                                             //     ?
//                                             const Color.fromRGBO(244, 67, 54, 1)
//                                         // : Colors.transparent
//                                         ,
//                                       )),
//                                   child:
//                                       // foods[index]
//                                       //         ["isFavorite"]
//                                       //     ?
//                                       Icon(
//                                     Icons.favorite,
//                                     color: Colors.red,
//                                   )
//                                   // : Icon(
//                                   //     Icons.favorite,
//                                   //     color: Colors.white,
//                                   //   )
//                                   ),
//                             ),
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Text(
//                                 "\$ ${contx.foods.values.elementAt(index).price}.00",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 40,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text(
//                                 "${contx.foods.values.elementAt(index).name}",
//                                 style:
//                                     TextStyle(color: Colors.white, fontSize: 20),
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             ],
//      ),
//         );

          // }
        }
      }),
    );
  }
}
