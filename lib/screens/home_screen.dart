import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:todolistapp/constant/app_colors.dart';
import 'package:todolistapp/controllers/theme_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Get.find<ThemeController>().isDark.value;

    return Scaffold(
      backgroundColor:
          isDark
              ? AppColors().darkModeColors[0]
              : AppColors().lightModeColors[0],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Iconsax.gallery,
                  color: isDark ? Colors.white : Colors.black,
                ),
                Spacer(),
                Text(
                  'Home Screen',
                  style: TextStyle(color: isDark ? Colors.white : Colors.black),
                ),
                Spacer(),
                RandomAvatar('saytoonz', height: 50, width: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
