import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/theme_controller.dart';
import '../core/app_colors.dart';
import '../core/widgets/glass_circle_widget.dart';
import '../core/widgets/text_widget.dart';
import '../models/project_model.dart';

class TaskScreen extends StatelessWidget {
  final ProjectModel project;

  const TaskScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    bool isDark = Get.find<ThemeController>().isDark.value;

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
            colors: [project.color, project.color.withBlue(200)],
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back button with glass effect
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        //Bottom Ciclar
                        glassCircleWidget(65, 65, 0.2, SizedBox()),

                        //Top Ciclar
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
                    Spacer(),
                    textWidget(
                      isDark: isDark,
                      txt: project.title,
                      fontSize: 24,
                      weight: 'r',
                    ),
                    Spacer(),
                    Spacer(),
                  ],
                ),
              ),

  
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        isDark
                            ? AppColors().darkModeColors[0]
                            : AppColors().lightModeColors[0],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
