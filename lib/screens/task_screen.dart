import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todolistapp/controllers/task_controller.dart';
import 'package:todolistapp/core/widgets/select_date_widget.dart';
import 'package:todolistapp/models/task_model.dart';
import '../controllers/date_controller.dart';
import '../controllers/theme_controller.dart';
import '../core/app_colors.dart';
import '../core/widgets/empty_widget.dart';
import '../core/widgets/glass_circle_widget.dart';
import '../core/widgets/task_status_widget.dart';
import '../core/widgets/text_widget.dart';
import '../models/project_model.dart';

class TaskScreen extends StatelessWidget {
  final ProjectModel project;

  const TaskScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    bool isDark = Get.find<ThemeController>().isDark.value;
    TextEditingController addTaskController = TextEditingController();
    var taskController = Get.find<TaskController>();
    var dateController = Get.find<DateController>();
        final activeTasks = taskController.tasks.where((task) => !task.isDone).toList();
    final completedTasks = taskController.tasks.where((task) => task.isDone).toList();
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
                child: glassCircleWidget(200, 200, 0.15, SizedBox()),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back button with glass effect
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        //Bottom Ciclar
                        glassCircleWidget(65, 65, 0.2, SizedBox()),

                        //Top Ciclar
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
                    Spacer(),
                    textWidget(
                      isDark: isDark,
                      txt: project.title,
                      fontSize: 24,
                      weight: 'r',
                    ),
                    Spacer(),
                    Spacer(),
                  ],
                ),
              ),
              Positioned(
                top: 120,
                left: 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 3,
                          height: 20,
                          color: Colors.white,
                          margin: const EdgeInsets.only(right: 10),
                        ),
                        textWidget(
                          isDark: false,
                          txt: ' Tasks',
                          isBottom: true,
                          fontSize: 16,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 120,
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
                          onPressed: () {
                            taskController.addTask(
                              TaskModel(
                                title: addTaskController.text,
                                deadline: dateController.selectedDate,
                              ),
                            );
                            /*
                            print(addTaskController.text);
                            print(dateController.selectedDate);
                            */
                          },
                          icon: Icon(Icons.add, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 250),
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        isDark
                            ? AppColors().darkModeColors[0]
                            : AppColors().lightModeColors[0],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ListView(
                        padding: const EdgeInsets.all(20),
                        children: [
                          // Active tasks
                          taskStatusWidget(
                            Colors.orange,
                            const Color.fromARGB(255, 253, 239, 218),

                            activeTasks.length,
                            'In Progress Task',
                          ),
                          const SizedBox(height: 20),
                          ...activeTasks.map(
                            (task) => buildTaskItemWidget(task, taskController),
                          ),

                          // Divider
                          if (completedTasks.isNotEmpty) ...[
                            const SizedBox(height: 30),
                            Container(
                              height: 2,
                              color: Colors.grey[100],
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                            ),
                            const SizedBox(height: 30),

                            // Completed tasks
                            taskStatusWidget(
                              Colors.green,
                              const Color.fromARGB(255, 232, 245, 233),

                              completedTasks.length,
                              'Completed Task',
                            ),

                            const SizedBox(height: 20),

                            ...completedTasks.map(
                              (task) => buildTaskItemWidget(
                                task,
                                taskController,
                              ), //_buildTaskItem(task),
                            ),
                          ],
                        ],
                      ),
                  /*Column(
                    children: [
                      Expanded(
                        child: Obx(
                          () =>
                              taskController.tasks.isEmpty
                                  ? emptyWidget()
                                  : Text(
                                    taskController.tasks[0].title,
                                    style: TextStyle(color: Colors.white),
                                  ),
                        ),
                      ),
                    ],
                  ),*/
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
