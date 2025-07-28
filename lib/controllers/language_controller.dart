import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LanguageController extends GetxController {
  final List<String> languageCodes = ['en', 'de', 'fa', 'ar'];
  final List<String> flagPaths = [
    'assets/flags/us.png',
    'assets/flags/de.png',
    'assets/flags/ir.png',
    'assets/flags/sa.png',
  ];

  final RxInt currentIndex = 0.obs;

  void nextLanguage() {
    currentIndex.value = (currentIndex.value + 1) % languageCodes.length;
    final langCode = languageCodes[currentIndex.value];
    final locale = _getLocaleFromLangCode(langCode);
    Get.updateLocale(locale);
  }

  Locale _getLocaleFromLangCode(String code) {
    switch (code) {
      case 'fa':
        return const Locale('fa', 'IR');
      case 'de':
        return const Locale('de', 'DE');
      case 'ar':
        return const Locale('ar', 'SA');
      case 'en':
      default:
        return const Locale('en', 'US');
    }
  }
}
