import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todolistapp/controllers/theme_controller.dart';
import 'package:todolistapp/core/widgets/show_add_project_dialog.dart';

import '../../controllers/project_controller.dart';


Widget newTaskBottomWidget(BuildContext context, Color projectnColor) {
  bool isDark = Get.find<ThemeController>().isDark.value;
  final ProjectController projectController=Get.find<ProjectController>();
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          // ignore: deprecated_member_use
          color: Colors.black.withOpacity(0.2),
          blurRadius: 10,
          spreadRadius: 2,
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.8),
            border: Border.all(
              // ignore: deprecated_member_use
              color: Colors.white.withOpacity(0.1),
              width: 1,
            ),
          ),
          child: IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () async {
              showAddProjectDialogWidget(
                context,
                projectController,
                '',
                'Add project',
                isDark,
                projectnColor,
              );
         
            },
          ),
        ),
      ),
    ),
  );
}
