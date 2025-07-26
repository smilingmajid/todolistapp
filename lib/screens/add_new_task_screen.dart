import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistapp/controllers/theme_controller.dart';
import 'package:todolistapp/core/app_colors.dart';
import 'package:todolistapp/core/widgets/glass_circle_widget.dart';
import 'package:todolistapp/core/widgets/text_widget.dart';
import '../controllers/project_controller.dart';
import '../core/widgets/build_text_field.dart';
import '../core/widgets/main_bottom.dart';

class AddNewProjectScreen extends StatelessWidget {
  final Color? projectColor;

  const AddNewProjectScreen({super.key, this.projectColor});

  @override
  Widget build(BuildContext context) {
    final TextEditingController addProjectController = TextEditingController();
    final projectController = Get.find<ProjectController>();
    final themeController = Get.find<ThemeController>();

    return Obx(() {
      final isDark = themeController.isDark.value;

      return Scaffold(
        backgroundColor: isDark
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
                  child: glassCircleWidget(200, 200, 0.15, const SizedBox()),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back button with glass effect
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          glassCircleWidget(65, 65, 0.2, const SizedBox()),
                          glassCircleWidget(
                            45,
                            45,
                            0.4,
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 24,
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      textWidget(
                        isDark: isDark,
                        txt: 'New Project',
                        fontSize: 24,
                        weight: 'r',
                      ),
                      const Spacer(),
                      const Spacer(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors().darkModeColors[0]
                          : AppColors().lightModeColors[0],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          buildTextField(
                            "New Project",
                            '',
                            addProjectController,
                            isDark,
                          ),
                          const Spacer(),
                          mainButton(
                            "Create",
                            () {
                              projectController.addProject(
                                addProjectController.text,
                                // ignore: deprecated_member_use
                                projectColor!.value,
                              );
                              addProjectController.clear();
                              Navigator.pop(context);   },
                            context,
                            isDark,
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
