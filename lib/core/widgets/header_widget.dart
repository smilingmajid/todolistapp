import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:todolistapp/core/widgets/text_widget.dart';

Widget headerWidget(bool isDark, {Function()? onPressed}) {
  return Row(
    children: [
      IconButton(
        onPressed: onPressed,
        icon: Icon(Iconsax.menu_1, color: isDark ? Colors.white : Colors.black),
      ),
      Spacer(),
      textWidget(
        isDark: isDark,
        txt: 'HomeScreen.AppBar'.tr,
        fontSize: 20,
       
      ),
      Spacer(),
      RandomAvatar('saytoonz', height: 50, width: 50),
    ],
  );
}
