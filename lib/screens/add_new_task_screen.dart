import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todolistapp/controllers/theme_controller.dart';
import 'package:todolistapp/core/app_colors.dart';
import 'package:todolistapp/core/widgets/text_widget.dart';

import '../controllers/project_controller.dart';
import '../core/widgets/build_text_field.dart';
import '../core/widgets/close_button_widget.dart';
import '../core/widgets/main_bottom.dart';

class AddNewProjectScreen extends StatelessWidget {
  const AddNewProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Get.find<ThemeController>().isDark.value;
    final TextEditingController addProjectController = TextEditingController();
    final projectController = Get.find<ProjectController>();
    return Scaffold(
      backgroundColor:
          isDark
              ? AppColors().darkModeColors[0]
              : AppColors().lightModeColors[0],
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            closeButtonWidget(context, isDark),
            const SizedBox(height: 30),
            textWidget(isDark: isDark, txt: 'New Project', fontSize: 32),
            Spacer(),
            buildTextField("New Project", '', addProjectController, isDark),
            Spacer(),
          
            mainButton("Create", () {
  projectController.addProject(addProjectController.text);
  addProjectController.clear();
  
}, context),
            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}


