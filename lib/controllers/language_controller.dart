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
  final RxBool isRtl = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadLanguage();
  }

  void nextLanguage() {
    final newIndex = (currentIndex.value + 1) % languageCodes.length;
    setLanguageByIndex(newIndex);
  }

  void setLanguageByIndex(int index) {
    currentIndex.value = index;
    final langCode = languageCodes[index];
    final locale = getLocaleFromLangCode(langCode);
    Hive.box('settings').put('langCode', langCode);
    isRtl.value = isRtlCode(langCode);
    Get.updateLocale(locale);
  }

  void _loadLanguage() {
    final langCode = Hive.box('settings').get('langCode', defaultValue: 'en');
    currentIndex.value = languageCodes.indexOf(langCode);
    isRtl.value = isRtlCode(langCode);
  }

  static Locale getLocaleFromLangCode(String code) {
    switch (code) {
      case 'fa':
        return Locale('fa', 'IR');
      case 'de':
        return Locale('de', 'DE');
      case 'ar':
        return Locale('ar', 'SA');
      case 'en':
      default:
        return Locale('en', 'US');
    }
  }

  bool isRtlCode(String code) {
    return code == 'fa' || code == 'ar';
  }
}
