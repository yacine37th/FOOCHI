import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/main_colors.dart';

class AppBarr extends StatelessWidget {
  final text;
  const AppBarr({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
      title: Text(text ?? null),
      //        actions: [
      //   Icon(Icons.favorite),
      //   Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 16),
      //     child: Icon(Icons.search),
      //   ),
      //   Icon(Icons.more_vert),
      // ],
    );
  }
}
