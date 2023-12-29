import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../functions/functions.dart';
import '../main.dart';
import '../theme/main_colors.dart';

// class AppBarr extends StatelessWidget {
//   final text;
//   const AppBarr({super.key, this.text});

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: AppColors.kBackground,
//       elevation: 0,
//       leading: IconButton(
//           onPressed: () {
//             navigator!.pop();
//           },
//           icon: Icon(
//             Icons.arrow_back_ios_outlined,
//             color: AppColors.kPrimary,
//             // size: 18,
//           )),
//       title: Text(text ?? null),
//       //        actions: [
//       //   Icon(Icons.favorite),
//       //   Padding(
//       //     padding: EdgeInsets.symmetric(horizontal: 16),
//       //     child: Icon(Icons.search),
//       //   ),
//       //   Icon(Icons.more_vert),
//       // ],
//     );
//   }
// }

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key, this.photoUrl});
  final String? photoUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: ClipOval(
      child: Container(
        alignment: Alignment.center,
        color:
            MainFunctions.generatePresizedColor(currentUserInfos.name!.length),
        child: Text(
          currentUserInfos.name![0].toUpperCase(),
          style: const TextStyle(fontSize: 27),
        ),
      ),
    ));
  }
}

class FoodPicture extends StatelessWidget {
  final String foodPicUrl;
  const FoodPicture({super.key, required this.foodPicUrl});

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.45,
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        image: DecorationImage(
            image: NetworkImage("${foodPicUrl}"), fit: BoxFit.fitWidth),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth / 13.7, vertical: screenHeight / 34.15),

          /// 30.0 - 20.0
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ArrowBack(),
              FavoriteFood(),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteFood extends StatelessWidget {
  const FavoriteFood({super.key});

  @override
Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return IconButton(
      onPressed: () {},
      icon: Icon(Icons.favorite),
      color: Colors.white,
      iconSize: screenHeight / 22.77,
    );
  }
}

class FoodName extends StatelessWidget {
  final String foodName;
  final int foodPrice;
  const FoodName({super.key, required this.foodName, required this.foodPrice});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Row(children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("${foodName}",
            style: TextStyle(
                color: Colors.black,
                fontSize: screenHeight! / 22.77,
                fontFamily: "Roboto")),

        /// 30
        Text("Category", style: TextStyle(color: Colors.black45, fontSize: 18)),
      ]),
      Spacer(),
      Text(
        "\$${foodPrice}",
        style:
            TextStyle(color: Colors.black87, fontSize: screenHeight! / 22.77),
      ),

      /// 30
    ]);
  }
}

class Stars extends StatelessWidget {
  const Stars({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: screenHeight / 45.54),

      /// 15.0
      child: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.star_rounded,
                color: Colors.red,
              ),
              Text(
                "4.6",
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight / 45.54),
              ),

              /// 15.0
              Padding(
                padding: EdgeInsets.only(left: screenWidth / 51.38),

                /// 8.0
                child: Text("(52+ Reviews)",
                    style: TextStyle(color: Colors.black26)),
              )
            ],
          ),
          Container(
            height: screenHeight / 34.15,
            width: screenWidth / 137,
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(10)),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: screenWidth / 51.38),

                /// 8.0
                child: Icon(
                  Icons.delivery_dining_sharp,
                  color: Colors.amber,
                  size: screenHeight / 22.77,
                ),
              ),
              Text(
                "FREE DELIVERY",
                style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight! / 42.69),
              )

              /// 16
            ],
          )
        ],
      )),
    );
  }
}



class FoodDescription extends StatelessWidget {
  const FoodDescription ({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: screenHeight! / 45.54),

      /// 15.0
      child: Container(
        child: Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud eslednjn",
          style: TextStyle(color: Colors.black38),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}


class ArrowBack extends StatelessWidget {
  const ArrowBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        height: screenHeight / 19.51,
        width: screenWidth / 10.28,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.25),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ));
  }
}


class MySeparator extends StatelessWidget {
  final double height;
  final Color color;
  const MySeparator({this.height = 1, this.color = Colors.black38});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = screenWidth / 57.71;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
