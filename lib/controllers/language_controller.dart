import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LanguageController extends GetxController {
  final RxInt _currentIndex = 0.obs;

  final List<Locale> locales = const [
    Locale('en', 'US'),
    Locale('de', 'DE'),
    Locale('fa', 'IR'),
    Locale('ar', 'SA'),
  ];

  void toggleLanguage() {
    _currentIndex.value = (_currentIndex.value + 1) % locales.length;
    Get.updateLocale(locales[_currentIndex.value]);
  }

  Locale get currentLocale => locales[_currentIndex.value];
}
