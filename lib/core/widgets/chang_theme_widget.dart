
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

Widget changThemeWidget(bool isDark,
dynamic onPressed,) {
  return Align(
    alignment: Alignment.centerLeft,
    child: IconButton(
      onPressed: onPressed,
      icon: Icon(
        isDark ? Iconsax.sun_1 : Iconsax.moon,
        color: isDark ? Colors.white : Colors.black,
      ),
    ),
  );
}
