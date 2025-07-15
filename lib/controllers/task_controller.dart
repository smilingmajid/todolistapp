import 'package:get/get.dart';
import '../models/task_model.dart';

class TaskController extends GetxController {
  RxList<TaskModel> tasks = <TaskModel>[].obs;


  void addTask(TaskModel task) {
    tasks.add(task);
  }



  void deleteTask(int index) {
    if (index >= 0 && index < tasks.length) {
      tasks.removeAt(index);
    }
  }


  void toggleDone(int index) {
    if (index >= 0 && index < tasks.length) {
      final task = tasks[index];
      tasks[index] = TaskModel(
        title: task.title,
        description: task.description,
        deadline: task.deadline,
        isDone: !task.isDone,
        createdAt: task.createdAt,
      );
    }
  }


  void updateTask(int index, TaskModel updatedTask) {
    if (index >= 0 && index < tasks.length) {
      tasks[index] = updatedTask;
    }
  }

 
  void clearAll() {
    tasks.clear();
  }
}
