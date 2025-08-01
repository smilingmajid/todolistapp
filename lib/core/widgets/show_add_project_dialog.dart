import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../controllers/project_controller.dart';
import 'text_widget.dart';

Future showAddProjectDialogWidget(
  BuildContext context,
  ProjectController projectController,
  String subtitle,
  String title,
  bool isDark,
  Color projectColor,
) {
  // ---
  var inputText = '';

  return showDialog(
    context: context,
    // ignore: deprecated_member_use
    barrierColor: Colors.black.withOpacity(0.4),
    builder:
        (context) => Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    // ignore: deprecated_member_use
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Icon(Iconsax.d_cube_scan, color: Colors.white),
                    ),
                    SizedBox(height: 15),
                    Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      onChanged: (value) => inputText = value,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white10,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),

                    textWidget(isDark: true, txt: subtitle, fontSize: 15),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: textWidget(
                            isDark: true,
                            txt: "Cancel",
                            fontSize: 14,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            projectController.addProject(
                              inputText,
                              // ignore: deprecated_member_use
                              projectColor.value,
                            );
                            Navigator.pop(context);
                          },
                          child: textWidget(
                            isDark: true,
                            txt: "Add",
                            fontSize: 14,
                            weight: "b",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
  );
}
