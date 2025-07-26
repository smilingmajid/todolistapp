

import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String? description;
  
  @HiveField(2)
  final bool isDone;
  @HiveField(3)
  final DateTime createdAt;
  @HiveField(4)
  final DateTime deadline;
  @HiveField(5)
  final String projectId; 

  TaskModel({
    required this.title,
    required this.deadline,
    required this.projectId,
    this.description,
    this.isDone = false,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

/*
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'isDone': isDone,
      'createdAt': createdAt.toIso8601String(),
      'deadline': deadline.toIso8601String(),
      'projectId': projectId,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'],
      description: map['description'],
      isDone: map['isDone'] ?? false,
      createdAt: DateTime.parse(map['createdAt']),
      deadline: DateTime.parse(map['deadline']),
      projectId: map['projectId'],
    );
  }*/
}
