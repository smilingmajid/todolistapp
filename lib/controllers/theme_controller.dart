import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxBool isDark = true.obs;

  void toggleTheme() {
    isDark.value = !isDark.value;
    update();
  }
}
