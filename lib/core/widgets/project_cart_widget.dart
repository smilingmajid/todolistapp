import 'package:flutter/material.dart';
import 'package:todolistapp/core/widgets/glassy_icon_bottom_widget.dart';
import 'package:todolistapp/core/widgets/text_widget.dart';
import 'package:todolistapp/screens/task_screen.dart';
import '../../models/project_model.dart';
import '/core/widgets/glass_circle_widget.dart';

Widget projectCardWidget(projectController, isDark, bool isRtl) {
  final stats = projectController.getProjectStats();

  return Column(
    children: [
      SizedBox(height: 50),
      Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 2,
            mainAxisSpacing: 15,
          ),
          itemCount: projectController.projectList.length,
          itemBuilder: (context, index) {
            final project = projectController.projectList[index];
            final projectStats = stats[project.id] ?? {'total': 0, 'done': 0};
            final total = projectStats['total'];
            final done = projectStats['done'];

            return GestureDetector(
              onTap: () async {
                ProjectModel selectedProject =
                    projectController.projectList[index];
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            TaskScreen(project: selectedProject, isRtl: isRtl),
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
                      colors: [project.color, project.color.withBlue(200)],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: -50,
                        right: isRtl ? null : -50,
                        left: isRtl ? -50 : null,
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
                            textWidget(
                              isBottom: true,
                              isDark: false,
                              txt: ' $done / $total',
                              weight: 'r',
                              fontSize: 16,
                            ),
                          ],
                        ),
                      ),
                      glassyIconBottomWidget(
                        context,
                        projectController,
                        index,
                        isDark,
                        isRtl,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
