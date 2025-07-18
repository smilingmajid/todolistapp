import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget emptyWidget() {
  return Column(
    children: [
      Lottie.asset('assets/empty.json'),

      Text(
        'No projects yet.\nTap + to add a new project.',
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
