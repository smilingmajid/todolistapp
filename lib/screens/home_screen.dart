import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:todolistapp/core/app_colors.dart';
import 'package:todolistapp/controllers/project_controller.dart';
import 'package:todolistapp/controllers/theme_controller.dart';

import '../core/widgets/empty_widget.dart';
import '../core/widgets/header_widget.dart';
import '../core/widgets/project_cart_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Get.find<ThemeController>().isDark.value;
    var projectController = Get.find<ProjectController>();

    return Scaffold(
      backgroundColor:
          isDark
              ? AppColors().darkModeColors[0]
              : AppColors().lightModeColors[0],
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            headerWidget(isDark),
            SizedBox(height: 50),

            Expanded(
              child: Obx(
                () =>
                    projectController.projects.isEmpty
                        ? emptyWidget()
                        : projectCardWidget(projectController),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
