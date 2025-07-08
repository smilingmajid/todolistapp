import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todolistapp/controllers/theme_controller.dart';
import 'package:todolistapp/core/app_colors.dart';
import 'package:todolistapp/core/widgets/text_widget.dart';

import '../core/widgets/close_button_widget.dart';

class AddNewProjectScreen extends StatelessWidget {
  const AddNewProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Get.find<ThemeController>().isDark.value;
    final TextEditingController addProjectController = TextEditingController();

    return Scaffold(
      backgroundColor:
          isDark
              ? AppColors().darkModeColors[0]
              : AppColors().lightModeColors[0],
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            closeButtonWidget(context, isDark),
            const SizedBox(height: 30),
            textWidget(isDark: isDark, txt: 'New Project', fontSize: 32),
            Spacer(),
            buildTextField("New Project", '', addProjectController, isDark),
            Spacer(),
            mainButton('Create '),
          ],
        ),
      ),
    );
  }
}

Widget buildTextField(
  String title,
  String hint,
  TextEditingController controller,
  bool isDark,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          color: isDark ? Colors.white : Colors.black,
          fontSize: 13,
          fontWeight: FontWeight.w500,
          fontFamily: 'ClashDisplay',
        ),
      ),
      const SizedBox(height: 15),
      TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget mainButton(String title) {
  return SizedBox(
    width: double.infinity,
    height: 50,
    child: ElevatedButton(
      onPressed: () async {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child:  Text(
        //'Task',
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: 'ClashDisplay',
        ),
      ),
    ),
  );
}
