import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../screens/splash_screen.dart';
import 'bindings/my_bindings.dart';
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

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
           supportedLocales: const [
        Locale('en', 'US'),
        Locale('de', 'DE'),
        Locale('fa', 'IR'),
        Locale('ar', 'SA'),
      ],
       translations: AppTranslations(), 
       locale:Locale('en', 'US'),
       fallbackLocale: Locale('fa', 'IR'),
      title: 'todolistapp',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      initialBinding: MyBindings(),
    );
  }
}
