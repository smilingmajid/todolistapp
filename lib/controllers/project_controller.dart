import 'package:get/get.dart';
import 'package:todolistapp/models/project_model.dart';

class ProjectController extends GetxController {
  RxList<ProjectModel> projectList = <ProjectModel>[].obs;

  void addProject(String title, int colorValue) {
    if (title.trim().isNotEmpty) {
      projectList.add(ProjectModel(
        title: title.trim(),
        colorValue: colorValue,
        tasks: [],
      ));
    }
  }

  void deleteProject(int index) {
    if (index >= 0 && index < projectList.length) {
      projectList.removeAt(index);
    }
  }
}
