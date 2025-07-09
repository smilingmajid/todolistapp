import 'package:get/get.dart';

class ProjectController extends GetxController {
  RxList<String> projects = <String>["Ali"].obs;
  

  void addProject(String name) {
    if (name.trim().isNotEmpty) {
      projects.add(name.trim());
    }
  }
}
