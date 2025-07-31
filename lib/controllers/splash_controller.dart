import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../screens/home_screen.dart';
import '../screens/onboarding_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 5), () async {
      final box = await Hive.openBox('ShowBox');
      final isFirstTime = box.get('isFirstTime', defaultValue: true);

      if (isFirstTime) {
        await box.put('isFirstTime', false);
        Get.off(() => OnboardingScreen());
      } else {
        Get.off(() => HomeScreen());
      }
    });
  }
}
