import 'dart:ui';

class ProjectModel {
  final String id;
  final String title;
  final int colorValue;

  ProjectModel({
    required this.id,
    required this.title,
    required this.colorValue,
  });

  Color get color => Color(colorValue);

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'colorValue': colorValue,
      };

  factory ProjectModel.fromMap(Map<String, dynamic> map) => ProjectModel(
        id: map['id'],
        title: map['title'],
        colorValue: map['colorValue'],
      );
}
