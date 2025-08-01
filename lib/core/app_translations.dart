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
      'OnboardingScreen': {
        'GetXTitle': 'GetX',
        'GetXBody': 'Used for state management, routing and dependencies.',
        'HiveTitle': 'Hive',
        'HiveBody': 'Local data storage powered by Hive.',
        'MVCTitle': 'Flutter MVC',
        'MVCBody': 'The app follows a Model-View-Controller architecture.',
        'StartTitle': 'Get Started',
        'StartBody': 'Ready to manage your tasks?',
        'StartButton': 'Start Now',
        'Skip': 'Skip',
        'Done': 'Done',
      },
      'Project': {
        'addProject': 'Add New Project',
        'add': 'Add',
        'cancel': 'Cancel',
      },
    }),

    'de_DE': flatten({
      'HomeScreen': {
        'AppBar': 'Home Screen',
        'NoProject': 'Noch keine Projekte vorhanden.\nTippe auf +, um ein neues Projekt hinzuzufügen',
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
      'OnboardingScreen': {
        'GetXTitle': 'GetX',
        'GetXBody': 'Wird für Zustandsverwaltung, Routing und Abhängigkeiten verwendet.',
        'HiveTitle': 'Hive',
        'HiveBody': 'Lokale Datenspeicherung mit Hive.',
        'MVCTitle': 'Flutter MVC',
        'MVCBody': 'Die App verwendet das MVC-Architekturmuster.',
        'StartTitle': 'Los geht\'s',
        'StartBody': 'Bereit, deine Aufgaben zu verwalten?',
        'StartButton': 'Jetzt starten',
        'Skip': 'Überspringen',
        'Done': 'Fertig',
      },
      'Project': {
        'addProject': 'Neues Projekt hinzufügen',
        'add': 'Hinzufügen',
        'cancel': 'Abbrechen',
      },
    }),

    'fa_IR': flatten({
      'HomeScreen': {
        'AppBar': 'صفحه اصلی',
        'NoProject': 'هنوز هیچ پروژه‌ای وجود ندارد.\nبرای افزودن پروژه جدید، روی + بزنید.',
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
      'OnboardingScreen': {
        'GetXTitle': 'GetX',
        'GetXBody': 'برای مدیریت وضعیت، مسیر‌یابی و وابستگی‌ها استفاده شده.',
        'HiveTitle': 'Hive',
        'HiveBody': 'برای ذخیره‌سازی داده‌های محلی از Hive استفاده شده است.',
        'MVCTitle': 'Flutter MVC',
        'MVCBody': 'برنامه از معماری MVC (مدل-نما-کنترلر) استفاده می‌کند.',
        'StartTitle': 'شروع کن',
        'StartBody': 'آماده‌ای وظایف‌ت رو مدیریت کنی؟',
        'StartButton': 'شروع',
        'Skip': 'رد کردن',
        'Done': 'اتمام',
      },
      'Project': {
        'addProject': 'افزودن پروژه جدید',
        'add': 'افزودن',
        'cancel': 'لغو',
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
      'OnboardingScreen': {
        'GetXTitle': 'GetX',
        'GetXBody': 'يستخدم لإدارة الحالة والتوجيه والاعتماديات.',
        'HiveTitle': 'Hive',
        'HiveBody': 'يتم تخزين البيانات محليًا باستخدام Hive.',
        'MVCTitle': 'Flutter MVC',
        'MVCBody': 'تتبع التطبيق نمط نموذج-عرض-تحكم (MVC).',
        'StartTitle': 'ابدأ',
        'StartBody': 'هل أنت مستعد لإدارة مهامك؟',
        'StartButton': 'ابدأ الآن',
        'Skip': 'تخطي',
        'Done': 'تم',
      },
      'Project': {
        'addProject': 'إضافة مشروع جديد',
        'add': 'إضافة',
        'cancel': 'إلغاء',
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
