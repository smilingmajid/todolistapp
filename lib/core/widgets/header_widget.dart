import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:random_avatar/random_avatar.dart';

Widget headerWidget(String txt,bool isDark, {Function()? onPressed}) {
  return Row(
    children: [
      IconButton(onPressed: onPressed, icon:  Icon(Iconsax.menu_1, color: isDark ? Colors.white : Colors.black)),
      Spacer(),
      Text(
        txt,
        style: TextStyle(color: isDark ? Colors.white : Colors.black),
      ),
      Spacer(),
      RandomAvatar('saytoonz', height: 50, width: 50),
    ],
  );
}
