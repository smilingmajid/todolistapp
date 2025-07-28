import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import '../models/project_model.dart';
import 'task_controller.dart';

class ProjectController extends GetxController {
  RxList<ProjectModel> projectList = <ProjectModel>[].obs;
  late final Box<ProjectModel> projectBox;
  final _uuid = Uuid();
  final taskController = Get.find<TaskController>();

  @override
  void onInit() {
    projectBox = Hive.box<ProjectModel>('projectBox');
    projectList.value = projectBox.values.toList();
    super.onInit();
  }

  void addProject(String title, int colorValue) {
    if (title.trim().isNotEmpty) {
      final project = ProjectModel(
        id: _uuid.v4(),
        title: title.trim(),
        colorValue: colorValue,
      );
      projectList.add(project);
      projectBox.add(project);
    }
  }

  void deleteProject(int index) {
    if (index >= 0 && index < projectList.length) {
      projectBox.deleteAt(index);
      projectList.removeAt(index);
    }
  }

  Map<String, Map<String, int>> getProjectStats() {
    return taskController.getTaskStatsByProject();
  }
}
