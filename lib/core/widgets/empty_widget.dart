import 'package:flutter/material.dart';

Widget emptyWidget() {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
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
    ),
  );
}
