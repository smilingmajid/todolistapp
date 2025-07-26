import 'package:get/get_navigation/src/root/internacionalization.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': flatten({
          'HomeScreen': {
            'AppBar': 'HomeScreen',
            'message': 'No Project',
          },
          'TaskScreen': {
            'AppBar': 'Tasks',
          },
        }),
        'fa_IR': flatten({
          'HomeScreen': {
            'AppBar': 'خانه',
            'message': 'هیچ پروژه‌ای نیست',
          },
          'TaskScreen': {
            'AppBar': 'وظایف',
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
