import 'package:flutter/material.dart';

Widget textWidget({
  required bool isDark,
  required String txt,
  bool isBottom = false,
  String weight = "r",
  double fontSize = 24,
  FontWeight fontWeight = FontWeight.normal,
  Color? color,
}) {
  String fontFamily = "ClashDisplay";

  switch (weight.toLowerCase()) {
    case "r":
      fontFamily = "ClashDisplay";
      break;
    case "title":
      fontFamily = "ClashDisplay";
      fontSize = 32;
      fontWeight = FontWeight.bold;
      break;
    case "m":
      fontFamily = "";
      break;
    case "c":
      fontFamily = "Cinema";
      break;
    case "d":
      fontFamily = "Dima";
      break;
  }

  final textColor =
      color ??
      (isBottom
          ? Colors.white
          : isDark
          ? Colors.white
          : Colors.black);

  return Text(
    txt,
    style: TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
    ),
  );
}
