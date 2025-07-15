import 'package:flutter/material.dart';
import 'package:todolistapp/core/app_colors.dart';
import 'package:todolistapp/core/widgets/text_widget.dart';

import '../../controllers/project_controller.dart';

Future showDialogWidget(
  BuildContext context,
  ProjectController projectController,
  int index,
  String subtitle,
  String title,
  bool isDark,
) {
  return showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          backgroundColor:
              isDark
                  ? AppColors().darkModeColors[0]
                  : AppColors().lightModeColors[0],
          title: Text(title),
          content: textWidget(
            isDark: true,
            txt: subtitle,
            fontSize: 15,
          ), //Text(subtitle),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: textWidget(isDark: true, txt: "Cancle", fontSize: 12),
            ),
            TextButton(
              onPressed: () {
                projectController.deleteProject(index);
                Navigator.pop(context);
                // onDelete?.call();
              },
              child: textWidget(
                isDark: true,
                txt: "Delete",
                fontSize: 12,
                weight: "b",
              ),
            ),
          ],
        ),
  );
}
