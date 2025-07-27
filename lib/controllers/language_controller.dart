import 'package:circle_flags/circle_flags.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LanguageController extends GetxController {
  final RxInt currentIndex = 0.obs;
  final RxList<String> languageNames = <String>[
    'English',
    'Deutsch',
    'فارسی',
    'العربية',
  ].obs;

  final RxList<CircleFlag> languageCodes = <CircleFlag>[
    CircleFlag('us'),
    CircleFlag('de'),
    CircleFlag('fa'),
    CircleFlag('ar'),
  ].obs;
  final List<Locale> locales = const [
    Locale('en', 'US'),
    Locale('de', 'DE'),
    Locale('fa', 'IR'),
    Locale('ar', 'SA'),
  ];

  void toggleLanguage() {
    currentIndex.value = (currentIndex.value + 1) % locales.length;
    Get.updateLocale(locales[currentIndex.value]);
  }

  Locale get currentLocale => locales[currentIndex.value];
}
