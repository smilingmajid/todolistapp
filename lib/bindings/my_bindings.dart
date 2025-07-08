import 'package:get/get.dart';
import '../controllers/splash_controller.dart';
import '../controllers/theme_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController(),);
    Get.put(SplashController(),);
  }
}
