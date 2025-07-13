class TaskModel {
  final String title;
  final bool isDone;

  TaskModel({
    required this.title,
    this.isDone = false,
  });

  Map<String, dynamic> toMap() => {
    'title': title,
    'isDone': isDone,
  };

  factory TaskModel.fromMap(Map<String, dynamic> map) => TaskModel(
    title: map['title'],
    isDone: map['isDone'] ?? false,
  );
}
