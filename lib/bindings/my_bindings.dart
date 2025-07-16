import 'package:get/get.dart';
import 'package:todolistapp/controllers/project_controller.dart';
import '../controllers/date_controller.dart';
import '../controllers/splash_controller.dart';
import '../controllers/task_controller.dart';
import '../controllers/theme_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController(),);
     Get.put(ProjectController(),);
    Get.put(SplashController(),);
    Get.put(TaskController(),);
     Get.put(DateController(),);
    /*
    Get.lazyPut(() => ProjectController(), fenix: true);
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => ThemeController(), fenix: true);*/
    // You can add more controllers or services here as needed
  }
}
