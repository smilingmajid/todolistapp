import 'package:flutter/material.dart';

Widget buildTextField(
  String title,
  String hint,
  TextEditingController controller,
  bool isDark,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          color: isDark ? Colors.white : Colors.black,
          fontSize: 13,
          fontWeight: FontWeight.w500,
          fontFamily: 'ClashDisplay',
        ),
      ),
      const SizedBox(height: 15),
      TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: isDark ? Colors.white : Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: isDark ? Colors.white : Colors.black),
          ),
        ),
      ),
    ],
  );
}
