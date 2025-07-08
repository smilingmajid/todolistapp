import 'package:get/get.dart';

import '../controller/theme_controller.dart';

class ThemeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController(),);
  }
}
