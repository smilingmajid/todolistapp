import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectController extends GetxController {
  RxList<String> projects = <String>["Ali"].obs;
RxList<Color> projectColors = <Color>[Colors.blue].obs;


  void addProject(String name, Color projectColor) {
    if (name.trim().isNotEmpty) {
      projects.add(name.trim());
      projectColors.add(projectColor);
    }
  }

  void deleteProject(int index) {
  if (index >= 0 && index < projects.length) {
    projects.removeAt(index);
    projectColors.removeAt(index);
  }
}



}
