import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:todolistapp/core/widgets/show_dialog_widget.dart';

import '../../controllers/project_controller.dart';

Widget glassyIconBottomWidget(
  BuildContext context,
  ProjectController projectController,
  int index,
  bool isDark,
  bool isRtl,
) {
  return Positioned(
    bottom: 20,
    right: isRtl ? null : 20,
    left: isRtl ? 20 : null,
    child: GestureDetector(
      onTap: () {
        showDialogWidget(
          context,
          projectController,
          index,
          'Are you sure you want to delete this project?',
          '',
          isDark,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(Iconsax.trash, color: Colors.white, size: 20),
      ),
    ),
  );
}
