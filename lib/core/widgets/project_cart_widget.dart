import 'package:flutter/material.dart';
import 'package:todolistapp/core/widgets/glassy_icon_bottom_widget.dart';
import 'package:todolistapp/core/widgets/text_widget.dart';
import 'package:todolistapp/screens/task_screen.dart';
import '/core/widgets/glass_circle_widget.dart';

Widget projectCardWidget(projectController, isDark) {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 1,
      childAspectRatio: 2,
      mainAxisSpacing: 15,
    ),
    itemCount: projectController.projects.length,
    itemBuilder: (context, index) {
      final project = projectController.projects[index];

      return GestureDetector(
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskScreen(//project: project
              ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  project.color,
                  project.color.withBlue(200),
                ],
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: -50,
                  right: -50,
                  child: glassCircleWidget(200, 200, 0.15, SizedBox()),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textWidget(
                        isBottom: true,
                        isDark: false,
                        txt: project.title,
                        weight: 'title',
                      ),
                    ],
                  ),
                ),
                glassyIconBottomWidget(
                  context,
                  projectController,
                  index,
                  isDark,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
