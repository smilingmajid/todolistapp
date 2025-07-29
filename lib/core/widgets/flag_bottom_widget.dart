
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../controllers/language_controller.dart';
/*

Widget flagBottomWidget(LanguageController languageController) {
  return Obx(
    () => IconButton(
      iconSize: 40,
      icon: Image.asset(
        languageController.flagPaths[languageController.currentIndex.value],
        width: 40,
        height: 40,
      ),
      onPressed: languageController.nextLanguage,
    ),
  );
}
*/


Widget flagDropdownWidget(LanguageController languageController, bool isDark) {
  return Obx(
    () => DropdownButton<int>(
      value: languageController.currentIndex.value,
      icon: const Icon(Icons.arrow_drop_down),
      dropdownColor: isDark ? Colors.black : Colors.white,
      underline: const SizedBox(), // حذف خط زیر دکمه
      onChanged: (int? newIndex) {
        if (newIndex != null) {
          languageController.currentIndex.value = newIndex;

          final langCode = languageController.languageCodes[newIndex];
          final locale = LanguageController.getLocaleFromLangCode(langCode);

          Hive.box('settings').put('langCode', langCode);
          languageController.isRtl.value =
              languageController._isRtl(langCode);
          Get.updateLocale(locale);
        }
      },
      items: List.generate(
        languageController.languageCodes.length,
        (index) => DropdownMenuItem<int>(
          value: index,
          child: Row(
            children: [
              Image.asset(
                languageController.flagPaths[index],
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 8),
              Text(
                languageController.languageCodes[index].toUpperCase(),
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
