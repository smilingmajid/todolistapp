import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../models/task_model.dart';

class TaskController extends GetxController {
  RxList<TaskModel> tasks = <TaskModel>[].obs;
  late final Box<TaskModel> taskBox;

  @override
  void onInit() {
    taskBox = Hive.box<TaskModel>('taskBox');
    tasks.value = taskBox.values.toList();
    super.onInit();
  }

  void addTask(TaskModel task) {
    tasks.add(task);
    taskBox.add(task);
  }

  void deleteTask(int index) {
    if (index >= 0 && index < tasks.length) {
      tasks.removeAt(index);
      taskBox.deleteAt(index);
    }
  }

  void toggleDone(int index) {
    if (index >= 0 && index < tasks.length) {
      final task = tasks[index];
      final newTask = TaskModel(
        title: task.title,
        description: task.description,
        deadline: task.deadline,
        isDone: !task.isDone,
        createdAt: task.createdAt,
        projectId: task.projectId,
      );
      tasks[index] = newTask;
      taskBox.putAt(index, newTask);
    }
  }

  void updateTask(int index, TaskModel updatedTask) {
    if (index >= 0 && index < tasks.length) {
      tasks[index] = updatedTask;
      taskBox.putAt(index, updatedTask);
    }
  }

  void clearAll() {
    tasks.clear();
    taskBox.clear();
  }

  List<TaskModel> getTasksByProject(String projectId) {
    return tasks.where((task) => task.projectId == projectId).toList();
  }

  Map<String, Map<String, int>> getTaskStatsByProject() {
    final Map<String, Map<String, int>> stats = {};
    for (var task in tasks) {
      final projectId = task.projectId;
      stats.putIfAbsent(projectId, () => {'total': 0, 'done': 0});
      stats[projectId]!['total'] = stats[projectId]!['total']! + 1;
      if (task.isDone) {
        stats[projectId]!['done'] = stats[projectId]!['done']! + 1;
      }
    }
    return stats;
  }
}
