import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

Widget emptyWidget() {
  return Column(
    children: [
      Lottie.asset('assets/empty.json'),

      Text(
        'HomeScreen.NoProject'.tr,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
          fontFamily: 'ClashDisplay',
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}
