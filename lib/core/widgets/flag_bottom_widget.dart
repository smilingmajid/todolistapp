import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistapp/core/widgets/text_widget.dart';
import '../../controllers/language_controller.dart';

Widget flagDropdownWidget(LanguageController languageController, bool isDark) {
  return Obx(
    () => DropdownButton<int>(
      value: languageController.currentIndex.value,
      icon: Icon(
        Icons.arrow_drop_down,
        color: isDark ? Colors.white : Colors.black,
      ),
      dropdownColor: isDark ? Colors.black : Colors.white,
      underline: SizedBox(),
      onChanged: (int? newIndex) {
        if (newIndex != null) {
          languageController.setLanguageByIndex(newIndex);
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
              SizedBox(width: 8),
              textWidget(
                isDark: isDark,
                txt: languageController.languageCodes[index],
                fontSize: 15,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
