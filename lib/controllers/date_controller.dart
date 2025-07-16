import 'package:get/get.dart';

class DateController extends GetxController {
  DateTime selectedDate = DateTime.now();

  selectDate(date) {
    selectedDate = date;
    update();
  }
}
