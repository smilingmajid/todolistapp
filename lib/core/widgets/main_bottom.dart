
import 'package:flutter/material.dart';

Widget mainButton(String title, VoidCallback onPressed, BuildContext context) {
  return SizedBox(
    width: double.infinity,
    height: 50,
    child: ElevatedButton(
      onPressed: () {
        onPressed(); // اجرای فانکشن اصلی
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('پروژه با موفقیت اضافه شد.'),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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

