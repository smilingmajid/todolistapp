import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:todolistapp/controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
     Get.find<SplashController>();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SizedBox(width: 500, child: Lottie.asset('assets/task.json')),
        ),
      ),
    );
  }
}
