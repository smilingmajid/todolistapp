import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:random_avatar/random_avatar.dart';

Widget headerWidget(bool isDark) {
  return Row(
    children: [
      Icon(Iconsax.gallery, color: isDark ? Colors.white : Colors.black),
      Spacer(),
      Text(
        'Home Screen',
        style: TextStyle(color: isDark ? Colors.white : Colors.black),
      ),
      Spacer(),
      RandomAvatar('saytoonz', height: 50, width: 50),
    ],
  );
}
