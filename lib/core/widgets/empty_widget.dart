import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget emptyWidget(String txt) {
  return Column(
    children: [
      Lottie.asset('assets/empty.json'),

      Text(
        txt,
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
