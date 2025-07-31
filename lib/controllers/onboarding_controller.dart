import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../screens/home_screen.dart';

class OnboardingController extends GetxController {
  final String keyName = 'onboarding_shown';

  Future<void> completeOnboarding() async {
    final box = await Hive.openBox('settings');
    await box.put(keyName, true);
    Get.offAll(() => const HomeScreen());
  }
}