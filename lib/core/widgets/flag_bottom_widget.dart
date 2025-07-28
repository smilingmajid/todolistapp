
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/language_controller.dart';

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
