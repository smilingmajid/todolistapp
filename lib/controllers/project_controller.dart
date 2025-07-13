import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectController extends GetxController {
  RxList<String> projects = <String>["Ali"].obs;
  RxList projectColors = [Colors.blue].obs;

  void addProject(String name, Color projectColor) {
    if (name.trim().isNotEmpty) {
      projects.add(name.trim());
      projectColors.add(projectColor);
    }
  }
}
