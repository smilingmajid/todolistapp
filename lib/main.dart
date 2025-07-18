import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_i18n/loaders/file_translation_loader.dart';
import 'dart:ui';
import '../screens/splash_screen.dart';
import 'bindings/my_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final deviceLocale = window.locale;

  final FlutterI18nDelegate translationDelegate = FlutterI18nDelegate(
    translationLoader: FileTranslationLoader(
      useCountryCode: false,
      fallbackFile: 'fa',
      basePath: 'assets/i18n',
      forcedLocale: null,
    ),
  );

  await translationDelegate.load(deviceLocale);

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
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        if (deviceLocale != null) {
          for (var locale in supportedLocales) {
            if (locale.languageCode == deviceLocale.languageCode) {
              return locale;
            }
          }
        }
        return const Locale('fa');
      },
    );
  }
}
