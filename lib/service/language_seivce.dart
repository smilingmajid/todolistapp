import 'dart:ui';

import 'package:hive/hive.dart';

class LanguageService {
  static const String boxName = 'settings';

  Future<void> saveLocale(String languageCode, String countryCode) async {
    final box = await Hive.openBox(boxName);
    await box.put('languageCode', languageCode);
    await box.put('countryCode', countryCode);
  }

  Future<Locale?> getSavedLocale() async {
    final box = await Hive.openBox(boxName);
    final langCode = box.get('languageCode');
    final countryCode = box.get('countryCode');

    if (langCode != null && countryCode != null) {
      return Locale(langCode, countryCode);
    }
    return null;
  }
}
