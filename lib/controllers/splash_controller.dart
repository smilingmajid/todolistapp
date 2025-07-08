
import 'package:get/get.dart';

import '../screens/home_screen.dart';



class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Future.delayed(
      const Duration(milliseconds: 3500),
      () async {
        Get.off(
          () =>  HomeScreen(),
        );
      },
    ).then((_) {});
  }
}
