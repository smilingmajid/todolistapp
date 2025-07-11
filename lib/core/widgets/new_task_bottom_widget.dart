import 'dart:ui';

import 'package:flutter/material.dart';

import '../../screens/add_new_task_screen.dart';

Widget newTaskBottomWidget(BuildContext context, Color projectnColor) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          // ignore: deprecated_member_use
          color: Colors.black.withOpacity(0.2),
          blurRadius: 10,
          spreadRadius: 2,
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.8),
            border: Border.all(
              // ignore: deprecated_member_use
              color: Colors.white.withOpacity(0.1),
              width: 1,
            ),
          ),
          child: IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () async {
             // print(projectnColor);
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          AddNewProjectScreen(projectColor: projectnColor),
                ),
              );
            },
          ),
        ),
      ),
    ),
  );
}
