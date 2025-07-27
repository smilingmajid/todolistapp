import 'package:get/get_navigation/src/root/internacionalization.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': flatten({
      'HomeScreen': {
        'AppBar': 'HomeScreen',
        'NoProject': 'No projects yet.\nTap + to add a new project.',
      },
      'TaskScreen': {'AppBar': 'Tasks'},
    }),
    'fa_IR': flatten({
      'HomeScreen': {
        'AppBar': 'خانه',
        'NoProject':
            'هنوز هیچ پروژه‌ای وجود ندارد.\nبرای افزودن پروژه جدید، روی + بزنید.',
      },
      'TaskScreen': {'AppBar': 'وظایف'},
    }),

    'de_DE': flatten({
      'HomeScreen': {
        'AppBar': 'خانه',
        'NoProject':
            'Noch keine Projekte vorhanden.\nTippe auf +, um ein neues Projekt hinzuzufügen',
      },
      'TaskScreen': {'AppBar': 'وظایف'},
    }),
    'ar_SA': flatten({
      'HomeScreen': {
        'AppBar': 'خانه',
        'NoProject':
            'Noch keine Projekte vorhanden.\nTippe auf +, um ein neues Projekt hinzuzufügen',
      },
      'TaskScreen': {'AppBar': 'وظایف'},
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
