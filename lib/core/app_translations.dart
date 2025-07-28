import 'package:get/get_navigation/src/root/internacionalization.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': flatten({
      'HomeScreen': {
        'AppBar': 'HomeScreen',
        'NoProject': 'No projects yet.\nTap + to add a new project.',
      },
      'TaskScreen': {
        'AddTask': 'Add New Task ...',
        'ActiveTask': 'In Progress Tasks',
        'CompletedTasks': 'Completed Tasks',
      },
    }),
    'fa_IR': flatten({
      'HomeScreen': {
        'AppBar': 'خانه',
        'NoProject':
            'هنوز هیچ پروژه‌ای وجود ندارد.\nبرای افزودن پروژه جدید، روی + بزنید.',
      },
      'TaskScreen': {
        'AddTask': 'افزودن وظیفه جدید ...',
        'ActiveTask': 'وظایف در حال انجام',
        'CompletedTasks': 'وظایف تکمیل‌شده',
      },
    }),

    'de_DE': flatten({
      'HomeScreen': {
        'AppBar': 'HomeScreen',
        'NoProject':
            'Noch keine Projekte vorhanden.\nTippe auf +, um ein neues Projekt hinzuzufügen',
      },
      'TaskScreen': {
        'AddTask': 'Neue Aufgabe hinzufügen ...',
        'ActiveTask': 'Laufende Aufgaben',
        'CompletedTasks': 'Abgeschlossene Aufgaben',
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
