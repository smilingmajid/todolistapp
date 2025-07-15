import 'dart:ui';
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
    barrierColor: Colors.black.withOpacity(0.4), // تار کردن پس‌زمینه
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent, // پس‌زمینه دیالوگ شفاف
      insetPadding: EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5), // شیشه‌ای با ته‌رنگ سیاه
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withOpacity(0.1),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 15),
                textWidget(
                  isDark: true,
                  txt: subtitle,
                  fontSize: 15,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: textWidget(
                          isDark: true, txt: "Cancel", fontSize: 14),
                    ),
                    TextButton(
                      onPressed: () {
                        projectController.deleteProject(index);
                        Navigator.pop(context);
                      },
                      child: textWidget(
                        isDark: true,
                        txt: "Delete",
                        fontSize: 14,
                        weight: "b",
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
