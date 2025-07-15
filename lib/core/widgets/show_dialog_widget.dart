import 'package:flutter/material.dart';
import 'package:todolistapp/core/widgets/text_widget.dart';

import '../../controllers/project_controller.dart';

Future showDialogWidget(
  BuildContext context,
  ProjectController projectController,
  int index,
  String subtitle,
  String title,
) {
  return showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: Text(title),
          content: Text(subtitle),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: textWidget(isDark: true, txt: "Cancle", fontSize: 15),
            ),
            TextButton(
              onPressed: () {
                projectController.deleteProject(index);
                Navigator.pop(context);
                // onDelete?.call();
              },
              child: textWidget(isDark: true, txt: "Delete", fontSize: 15),
            ),
          ],
        ),
  );
}
