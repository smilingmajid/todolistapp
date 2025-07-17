import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../models/project_model.dart';

class ProjectController extends GetxController {
  RxList<ProjectModel> projectList = <ProjectModel>[].obs;
  final _uuid = Uuid();

  void addProject(String title, int colorValue) {
    if (title.trim().isNotEmpty) {
      projectList.add(ProjectModel(
        id: _uuid.v4(), 
        title: title.trim(),
        colorValue: colorValue,
      ));
    }
  }

  void deleteProject(int index) {
    if (index >= 0 && index < projectList.length) {
      projectList.removeAt(index);
    }
  }
}
