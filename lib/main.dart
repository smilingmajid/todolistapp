import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_i18n/loaders/file_translation_loader.dart';
import '../screens/splash_screen.dart';
import 'bindings/my_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final FlutterI18nDelegate translationDelegate = FlutterI18nDelegate(
    translationLoader: FileTranslationLoader(
      useCountryCode: false,
      fallbackFile: 'en',
      basePath: 'assets/i18n',
      forcedLocale: const Locale('en'),
    ),
  );

 await translationDelegate.load(const Locale('en'));

  runApp(MyApp(translationDelegate));
}

class MyApp extends StatelessWidget {
  final FlutterI18nDelegate translationDelegate;

  const MyApp(this.translationDelegate, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'todolistapp',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      initialBinding: MyBindings(),
      localizationsDelegates: [
        translationDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('fa'),
        Locale('ar'),
        Locale('de'),
      ],
    );
  }
}
