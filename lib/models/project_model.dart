import 'dart:ui';

import 'task_model.dart';

class ProjectModel {
  final String title;
  final int colorValue;
  final List<TaskModel> tasks;

  ProjectModel({
    required this.title,
    required this.colorValue,
    required this.tasks,
  });

  Color get color => Color(colorValue);

  
  int get completedTasksCount => tasks.where((t) => t.isDone).length;

  int get totalTasksCount => tasks.length;

  
  String get progressFraction => "$completedTasksCount/$totalTasksCount";

  Map<String, dynamic> toMap() => {
        'title': title,
        'colorValue': colorValue,
        'tasks': tasks.map((e) => e.toMap()).toList(),
      };

  factory ProjectModel.fromMap(Map<String, dynamic> map) => ProjectModel(
        title: map['title'],
        colorValue: map['colorValue'],
        tasks: List<Map<String, dynamic>>.from(map['tasks'] ?? [])
            .map((e) => TaskModel.fromMap(e))
            .toList(),
      );
}
