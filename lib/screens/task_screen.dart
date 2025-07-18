import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/date_controller.dart';
import '../controllers/task_controller.dart';
import '../controllers/theme_controller.dart';
import '../core/app_colors.dart';
import '../core/widgets/build_task_item_widget.dart';
import '../core/widgets/glass_circle_widget.dart';
import '../core/widgets/select_date_widget.dart';
import '../core/widgets/task_status_widget.dart';
import '../core/widgets/text_widget.dart';
import '../models/project_model.dart';
import '../models/task_model.dart';

class TaskScreen extends StatelessWidget {
  final ProjectModel project;

  const TaskScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<TaskController>();
    final dateController = Get.find<DateController>();
    final themeController = Get.find<ThemeController>();
    final TextEditingController addTaskController = TextEditingController();

    return Obx(() {
      bool isDark = themeController.isDark.value;

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
                  child: glassCircleWidget(200, 200, 0.15, const SizedBox()),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          glassCircleWidget(65, 65, 0.2, const SizedBox()),
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
                      const Spacer(),
                      textWidget(
                        isDark: isDark,
                        txt: project.title,
                        fontSize: 24,
                        weight: 'r',
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                ),
                Positioned(
                  top: 120,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: addTaskController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Add new task...',
                            hintStyle: TextStyle(
                              // ignore: deprecated_member_use
                              color: Colors.white.withOpacity(0.7),
                              fontFamily: 'ClashDisplay',
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      selectDateWidget(context, dateController),
                      IconButton(
                        icon: const Icon(Icons.add, color: Colors.white),
                        onPressed: () {
                          if (addTaskController.text.trim().isEmpty) {
                            Get.snackbar(
                              'Error',
                              'Task title cannot be empty',
                              backgroundColor: Colors.redAccent,
                              colorText: Colors.white,
                            );
                            return;
                          }
                          taskController.addTask(
                            TaskModel(
                              title: addTaskController.text.trim(),
                              deadline: dateController.selectedDate,
                              projectId: project.id,
                            ),
                          );
                          addTaskController.clear();
                        },
                      ),
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
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Obx(() {
                      final allTasks = taskController.getTasksByProject(
                        project.id,
                      );
                      final activeTasks =
                          allTasks.where((task) => !task.isDone).toList();
                      final completedTasks =
                          allTasks.where((task) => task.isDone).toList();

                      return ListView(
                        padding: const EdgeInsets.all(20),
                        children: [
                          taskStatusWidget(
                            Colors.orange,
                            const Color.fromARGB(255, 253, 239, 218),
                            activeTasks.length,
                            'In Progress Tasks',
                          ),
                          const SizedBox(height: 20),
                          ...activeTasks.map((task) {
                            final realIndex = taskController.tasks.indexOf(
                              task,
                            );
                            return buildTaskItemWidget(
                              task,
                              taskController,
                              isDark,
                              realIndex,
                            );
                          }),
                          if (completedTasks.isNotEmpty) ...[
                            const SizedBox(height: 30),
                            Container(
                              height: 2,
                              color:
                                  isDark
                                      ? AppColors().darkModeColors[1]
                                      : AppColors().lightModeColors[1],
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                            ),
                            const SizedBox(height: 30),
                            taskStatusWidget(
                              Colors.green,
                              const Color.fromARGB(255, 232, 245, 233),
                              completedTasks.length,
                              'Completed Tasks',
                            ),
                            const SizedBox(height: 20),
                            ...completedTasks.map((task) {
                              final realIndex = taskController.tasks.indexOf(
                                task,
                              );
                              return buildTaskItemWidget(
                                task,
                                taskController,
                                isDark,
                                realIndex,
                              );
                            }),
                          ],
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
