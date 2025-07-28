import 'package:get/get_navigation/src/root/internacionalization.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': flatten({
      'HomeScreen': {
        'AppBar': 'Home Screen',
        'NoProject': 'No projects yet.\nTap + to add a new project.',
      },
      'TaskScreen': {
        'AddTask': 'Add New Task ...',
        'ActiveTask': 'In Progress Tasks',
        'CompletedTasks': 'Completed Tasks',
      },
      'DrawerWidget': {
        'GitHub': 'GitHub',
        'Instagram': 'Instagram',
        'Lindin': 'Linkedin',
        'Telegram': 'Telegram',
        'YouTube': 'YouTube',
        'Name': 'Majid Ghasemy',
        'Job': 'Mid Level flutter Developer',
      },
    }),

    'de_DE': flatten({
      'HomeScreen': {
        'AppBar': 'Home Screen',
        'NoProject':
            'Noch keine Projekte vorhanden.\nTippe auf +, um ein neues Projekt hinzuzufügen',
      },
      'TaskScreen': {
        'AddTask': 'Neue Aufgabe hinzufügen ...',
        'ActiveTask': 'Laufende Aufgaben',
        'CompletedTasks': 'Abgeschlossene Aufgaben',
      },

      'DrawerWidget': {
        'GitHub': 'GitHub',
        'Instagram': 'Instagram',
        'Lindin': 'Linkedin',
        'Telegram': 'Telegram',
        'YouTube': 'YouTube',
        'Name': 'Majid Ghasemy',
        'Job': 'Mid Level flutter Developer',
      },
    }),
    'fa_IR': flatten({
      'HomeScreen': {
        'AppBar': 'صفحه اصلی',
        'NoProject':
            'هنوز هیچ پروژه‌ای وجود ندارد.\nبرای افزودن پروژه جدید، روی + بزنید.',
      },
      'TaskScreen': {
        'AddTask': 'افزودن وظیفه جدید ...',
        'ActiveTask': 'وظایف در حال انجام',
        'CompletedTasks': 'وظایف تکمیل‌شده',
      },
      'DrawerWidget': {
        'GitHub': 'گیت هاب',
        'Instagram': 'اینستاگرام',
        'Lindin': 'لینکدین',
        'Telegram': 'تلگرام',
        'YouTube': 'یوتیوب',
        'Name': 'مجید قاسمی',
        'Job': 'توسعه دهنده فلاتر',
      },
    }),

    'ar_SA': flatten({
      'HomeScreen': {
        'AppBar': 'الرئيسية',
        'NoProject': 'لا توجد مشاريع بعد.\nانقر على + لإضافة مشروع جديد.',
      },
      'TaskScreen': {
        'AddTask': 'أضف مهمة جديدة ...',
        'ActiveTask': 'المهام الجارية',
        'CompletedTasks': 'المهام المكتملة',
      },
      'DrawerWidget': {
        'GitHub': 'جيت هاب',
        'Instagram': 'إنستغرام',
        'Lindin': 'لينكد إن',
        'Telegram': 'تيليجرام',
        'YouTube': 'يوتيوب',
        'Name': 'مجيد قاسمي',
        'Job': 'مطور فلاتر',
      },
    }),
  };

  Map<String, String> flatten(Map<String, dynamic> map, [String prefix = '']) {
    Map<String, String> result = {};
    map.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        result.addAll(flatten(value, '$prefix$key.'));
      } else if (value is String) {
        result[prefix + key] = value;
      }
    });
    return result;
  }
}
