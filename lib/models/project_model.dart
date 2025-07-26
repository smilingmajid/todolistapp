import 'dart:ui';

import 'package:hive/hive.dart';
part 'project_model.g.dart';

@HiveType(typeId: 0)

class ProjectModel {

    @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final int colorValue;

  ProjectModel({
    required this.id,
    required this.title,
    required this.colorValue,
  });
  
  /*

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
      );*/
}
