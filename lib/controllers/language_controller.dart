import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LanguageController extends GetxController {
  final List<String> languageCodes = ['en', 'de', 'fa', 'ar'];
  final List<String> flagPaths = [
    'assets/image/us.png',
    'assets/image/de.png',
    'assets/image/ir.png',
    'assets/image/sa.png',
  ];

  final RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _loadLanguage();
  }

  void nextLanguage() {
    currentIndex.value = (currentIndex.value + 1) % languageCodes.length;
    final langCode = languageCodes[currentIndex.value];
    final locale = getLocaleFromLangCode(langCode);
    Hive.box('settings').put('langCode', langCode);

    Get.updateLocale(locale);
  }

  void _loadLanguage() {
    final langCode = Hive.box('settings').get('langCode', defaultValue: 'en');
    currentIndex.value = languageCodes.indexOf(langCode);
  }

  static Locale getLocaleFromLangCode(String code) {
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
