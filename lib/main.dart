import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../screens/splash_screen.dart';
import 'bindings/my_bindings.dart';
import 'controllers/language_controller.dart';
import 'core/app_translations.dart';
import 'models/project_model.dart';
import 'models/task_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(ProjectModelAdapter());
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<ProjectModel>('projectBox');
  await Hive.openBox<TaskModel>('taskBox');
  await Hive.openBox('settings');
  final box = Hive.box('settings');
  String? langCode = box.get('langCode', defaultValue: 'en');
  Locale locale = LanguageController.getLocaleFromLangCode(langCode!);

  runApp(MyApp(initialLocale: locale));
}

class MyApp extends StatelessWidget {
  final Locale initialLocale;
  const MyApp({super.key, required this.initialLocale});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppTranslations(),
      locale: initialLocale,
      fallbackLocale: Locale('en', 'US'),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('de', 'DE'),
        Locale('fa', 'IR'),
        Locale('ar', 'SA'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'todolistapp',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      initialBinding: MyBindings(),
    );
  }
}
