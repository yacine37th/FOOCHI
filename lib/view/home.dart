import 'package:flutter/material.dart';

import '../theme/main_colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      appBar: AppBar(
        backgroundColor: AppColors.kBackground,
        elevation: 1,
      ),
      body: Center(
        child: Text("HOME PAGE"),
      ),
    );
  }
}
