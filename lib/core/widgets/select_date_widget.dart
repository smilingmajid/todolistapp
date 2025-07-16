
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

Widget selectDateWidget(BuildContext context, DateController dateController) {
  return IconButton(
    icon: const Icon(Iconsax.calendar, color: Colors.white),
    onPressed: () async {
      final date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)),
      );
      if (date != null) {
        dateController.selectDate(date);
      }
    },
  );
}
