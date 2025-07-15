import 'package:flutter/material.dart';
import 'package:todolistapp/core/widgets/text_widget.dart';

Widget mainButton(String title, VoidCallback onPressed, BuildContext context , bool isDark) {
  return SizedBox(
    width: double.infinity,
    height: 50,
    child: ElevatedButton(
      onPressed: () {
        onPressed();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:textWidget(isDark: isDark, txt: "The project was successfully created."),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: 'ClashDisplay',
        ),
      ),
    ),
  );
}
