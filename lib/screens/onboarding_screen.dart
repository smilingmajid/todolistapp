import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'OnboardingScreen.GetXTitle'.tr,
          body: 'OnboardingScreen.GetXBody'.tr,
          image: Center(child: Image.asset('assets/images/getx.png', height: 175)),
        ),
        PageViewModel(
          title: 'OnboardingScreen.HiveTitle'.tr,
          body: 'OnboardingScreen.HiveBody'.tr,
          image: Center(child: Image.asset('assets/images/hive.png', height: 175)),
        ),
        PageViewModel(
          title: 'OnboardingScreen.MVCTitle'.tr,
          body: 'OnboardingScreen.MVCBody'.tr,
          image: Center(child: Image.asset('assets/images/mvc.png', height: 175)),
        ),
        PageViewModel(
          title: 'OnboardingScreen.StartTitle'.tr,
          body: 'OnboardingScreen.StartBody'.tr,
          image: const Center(child: Icon(Icons.task_alt, size: 150)),
          footer: ElevatedButton(
            onPressed: controller.completeOnboarding,
            child: Text('OnboardingScreen.StartButton'.tr),
          ),
        ),
      ],
      onDone: controller.completeOnboarding,
      onSkip: controller.completeOnboarding,
      showSkipButton: true,
      skip: Text('OnboardingScreen.Skip'.tr),
      next: const Icon(Icons.arrow_forward),
      done: Text('OnboardingScreen.Done'.tr, style: const TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(activeColor: Colors.black),
    );
  }
}








Ask ChatGPT
