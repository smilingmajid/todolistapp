import 'package:get/get.dart';
import 'package:todolistapp/controllers/project_controller.dart';
import '../controllers/date_controller.dart';
import '../controllers/adrawer_controller.dart';
import '../controllers/language_controller.dart';
import '../controllers/splash_controller.dart';
import '../controllers/task_controller.dart';
import '../controllers/theme_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    /*
    Get.put(ThemeController(),);
     Get.put(ProjectController(),);
    Get.put(SplashController(),);
    Get.put(TaskController(),);
     Get.put(DateController(),);
     Get.put(ADrawerController(),);
        Get.put(LanguageController(),);*/
    Get.lazyPut(() => TaskController(), fenix: true);
    Get.lazyPut(() => ProjectController(), fenix: true);
    Get.lazyPut(() => DateController(), fenix: true);
    Get.lazyPut(() => ADrawerController(), fenix: true);
    Get.lazyPut(() => LanguageController(), fenix: true);
    Get.lazyPut(() => ThemeController(), fenix: true);
    Get.lazyPut(() => SplashController(), fenix: true);
  }
}
