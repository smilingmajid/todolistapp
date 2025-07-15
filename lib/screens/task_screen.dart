import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/project_controller.dart';
import '../controllers/theme_controller.dart';
import '../core/app_colors.dart';
import '../core/widgets/glass_circle_widget.dart';

class TaskScreen extends StatelessWidget {
  final Color? projectColor;
  const TaskScreen({super.key, this.projectColor});

  @override
  Widget build(BuildContext context) {
    bool isDark = Get.find<ThemeController>().isDark.value;
    var projectController = Get.find<ProjectController>();
    return Scaffold(
      backgroundColor:
          isDark
              ? AppColors().darkModeColors[0]
              : AppColors().lightModeColors[0],

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [projectColor!, projectColor!.withBlue(200)],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: -50,
                right: -50,
                child: glassCircleWidget(200, 200, 0.15, SizedBox()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
