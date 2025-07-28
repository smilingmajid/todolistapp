import 'package:flutter/material.dart';
import 'package:todolistapp/core/widgets/text_widget.dart';

Widget taskStatusWidget(
  Color statusColor,
  Color bgColor,
  int length,
  String title,
) {
  return Row(
    children: [
      Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: bgColor, //Colors.orange[50],
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            //activeTasks
            '$length',
            style: TextStyle(
              color: statusColor,
              fontSize: 16,
              fontWeight: FontWeight.w800,
              //letterSpacing: 1.2,
            ),
          ),
        ),
      ),
      SizedBox(width: 20),
      textWidget(isDark: true, txt: title, fontSize: 16),
    ],
  );
}
