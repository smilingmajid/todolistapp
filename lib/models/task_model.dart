class TaskModel {
  final String title;
  final String? description;
  final bool isDone;
  final DateTime createdAt;
  final DateTime deadline;
  final String projectId; 

  TaskModel({
    required this.title,
    required this.deadline,
    required this.projectId,
    this.description,
    this.isDone = false,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

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
  }
}
