import 'package:get/get.dart';
import 'package:todolistapp/controllers/project_controller.dart';
import '../controllers/splash_controller.dart';
import '../controllers/theme_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController(),);
     Get.put(ProjectController(),);
    Get.put(SplashController(),);
  }
}
