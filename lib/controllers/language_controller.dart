import 'package:get/get.dart';
import 'package:flutter/material.dart';


class LanguageController extends GetxController {
  final RxInt currentIndex = 0.obs;

  final List<Locale> supportedLocales = const [
    Locale('en', 'US'),
    Locale('de', 'DE'),
    Locale('fa', 'IR'),
    Locale('ar', 'SA'),
  ];

  final List<String> languageNames = [
    'English',
    'Deutsch',
    'فارسی',
    'العربية',
  ];

  final List<String> flagCodes = [
    'us',
    'de',
    'ir',
    'sa',
  ];

  void nextLanguage() {
    currentIndex.value = (currentIndex.value + 1) % supportedLocales.length;
    Get.updateLocale(supportedLocales[currentIndex.value]);
  }

  String get currentFlagCode => flagCodes[currentIndex.value];

  String get currentLanguageName => languageNames[currentIndex.value];
}
