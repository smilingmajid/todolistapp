import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistapp/models/project_model.dart';

class ProjectController extends GetxController {
  RxList<ProjectModel> projects = <ProjectModel>[].obs;

  void addProject(String name, Color color) {
    if (name.trim().isNotEmpty) {
      final newProject = ProjectModel(
        title: name.trim(),
        // ignore: deprecated_member_use
        colorValue: color.value,
        tasks: [],
      );
      projects.add(newProject);
    }
  }

  void deleteProject(int index) {
    if (index >= 0 && index < projects.length) {
      projects.removeAt(index);
    }
  }
}
