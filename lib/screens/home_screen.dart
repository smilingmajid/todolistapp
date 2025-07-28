import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

import 'package:todolistapp/core/project_colors.dart';
import '../controllers/adrawer_controller.dart';
import '../controllers/language_controller.dart';
import '../core/app_colors.dart';
import '../controllers/project_controller.dart';
import '../controllers/theme_controller.dart';
import '../core/widgets/drawer_widget.dart';
import '../core/widgets/empty_widget.dart';
import '../core/widgets/header_widget.dart';
import '../core/widgets/new_task_bottom_widget.dart';
import '../core/widgets/project_cart_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final projectController = Get.find<ProjectController>();
    final drawerController = Get.find<ADrawerController>();
    final languageController = Get.find<LanguageController>();

    return Obx(() {
      final isDark = themeController.isDark.value;

      return AdvancedDrawer(
        backdropColor:
            isDark
                ? AppColors().darkModeColors[0]
                : AppColors().lightModeColors[0],
        controller: drawerController.advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        disabledGestures: false,
        childDecoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.white30 : Colors.black45,
              blurRadius: 20.0,
              spreadRadius: 5.0,
              offset: const Offset(-20.0, 0.0),
            ),
          ],
          borderRadius: BorderRadius.circular(30),
        ),
        drawer: drawerWidget(
          languageController,
          isDark,
          onPressed: () {
            themeController.toggleTheme();
          },
        ),
        child: Scaffold(
          backgroundColor:
              isDark
                  ? AppColors().darkModeColors[0]
                  : AppColors().lightModeColors[0],
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                headerWidget(
                  isDark,
                  onPressed: () {
                    drawerController.advancedDrawerController.showDrawer();
                  },
                ),
                Expanded(
                  child: Obx(
                    () =>
                        projectController.projectList.isEmpty
                            ? emptyWidget()
                            : projectCardWidget(projectController, isDark),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: Obx(() {
            int index =
                projectController.projectList.length %
                ProjectColors.palette.length;
            return newTaskBottomWidget(context, ProjectColors.palette[index]);
          }),
        ),
      );
    });
  }
}
