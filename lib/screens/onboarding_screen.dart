import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:todolistapp/core/widgets/text_widget.dart';
import '../../../core/widgets/flag_bottom_widget.dart';
import '../../../core/widgets/chang_theme_widget.dart';
import '../controllers/language_controller.dart';
import '../controllers/onboarding_controller.dart';
import '../controllers/theme_controller.dart';
import '../core/app_colors.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final controller = Get.find<OnboardingController>();
  final languageController = Get.find<LanguageController>();
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = themeController.isDark.value;

      return SafeArea(
        child: Scaffold(
          backgroundColor:
              isDark
                  ? AppColors().darkModeColors[0]
                  : AppColors().lightModeColors[0],
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
                child: Row(
                  children: [
                    changThemeWidget(isDark, themeController.toggleTheme),
                    const Spacer(),
                    flagDropdownWidget(languageController, isDark),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: IntroductionScreen(
                        pages: [
                          PageViewModel(
                            decoration: PageDecoration(
                              pageColor:
                                  isDark
                                      ? AppColors().darkModeColors[0]
                                      : AppColors().lightModeColors[0],
                            ),
                            titleWidget: textWidget(
                              isDark: isDark,
                              txt: 'OnboardingScreen.MVCTitle'.tr,
                              fontWeight: FontWeight.w500,
                            ),
                            bodyWidget: textWidget(
                              fontSize: 15,
                              fontWeight: FontWeight.w200,
                              isDark: isDark,
                              txt: 'OnboardingScreen.MVCBody'.tr,
                            ),
                            image: Center(
                              child: SizedBox(
                                width: 500,
                                child: Lottie.asset('assets/Hive.json'),
                              ),
                            ),
                          ),
                          PageViewModel(
                            decoration: PageDecoration(
                              pageColor:
                                  isDark
                                      ? AppColors().darkModeColors[0]
                                      : AppColors().lightModeColors[0],
                            ),
                            titleWidget: textWidget(
                              isDark: isDark,
                              txt: 'OnboardingScreen.GetXTitle'.tr,
                              fontWeight: FontWeight.w500,
                            ),
                            bodyWidget: Container(
                              alignment: Alignment.center,
                              child: textWidget(
                                fontSize: 15,
                                fontWeight: FontWeight.w200,
                                isDark: isDark,
                                txt: 'OnboardingScreen.GetXBody'.tr,
                              ),
                            ),
                            image: Center(
                              child: SizedBox(
                                width: 500,
                                child: Lottie.asset('assets/mvc.json'),
                              ),
                            ),
                          ),
                          PageViewModel(
                            decoration: PageDecoration(
                              pageColor:
                                  isDark
                                      ? AppColors().darkModeColors[0]
                                      : AppColors().lightModeColors[0],
                            ),
                            titleWidget: textWidget(
                              isDark: isDark,
                              txt: 'OnboardingScreen.HiveTitle'.tr,
                              fontWeight: FontWeight.w500,
                            ),
                            bodyWidget: textWidget(
                              fontSize: 15,
                              fontWeight: FontWeight.w200,
                              isDark: isDark,
                              txt: 'OnboardingScreen.HiveBody'.tr,
                            ),
                            image: Center(
                              child: SizedBox(
                                width: 500,
                                child: Lottie.asset('assets/Getx.json'),
                              ),
                            ),
                          ),
                          PageViewModel(
                            decoration: PageDecoration(
                              pageColor:
                                  isDark
                                      ? AppColors().darkModeColors[0]
                                      : AppColors().lightModeColors[0],
                            ),
                            titleWidget: textWidget(
                              isDark: isDark,
                              txt: 'OnboardingScreen.StartTitle'.tr,
                              fontWeight: FontWeight.w500,
                            ),
                            bodyWidget: textWidget(
                              isDark: isDark,
                              txt: 'OnboardingScreen.StartBody'.tr,
                              fontSize: 15,
                              fontWeight: FontWeight.w200,
                            ),
                            image: SizedBox(
                              width: 500,
                              child: Lottie.asset('assets/task.json'),
                            ),
                          ),
                        ],
                        onDone: controller.completeOnboarding,
                        onSkip: controller.completeOnboarding,
                        showSkipButton: true,
                        skip: textWidget(
                          isDark: isDark,
                          txt: 'OnboardingScreen.Skip'.tr,
                          fontSize: 15,
                        ),
                        next: Icon(
                          Icons.arrow_forward,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                        done: textWidget(
                          isDark: isDark,
                          txt: 'OnboardingScreen.Done'.tr,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        dotsDecorator: DotsDecorator(
                          activeColor: isDark ? Colors.white : Colors.black,
                          color: Colors.grey,
                        ),
                        dotsContainerDecorator: BoxDecoration(
                          color:
                              isDark
                                  ? AppColors().darkModeColors[0]
                                  : AppColors().lightModeColors[0],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
