import 'dart:io';

import 'package:click_app/src/config/routes/app_routes.dart';
import 'package:click_app/src/config/themes/get_theme.dart';
import 'package:click_app/src/core/languages/translation.dart';
import 'package:click_app/src/presentation/pages/language_list/language_list_controller.dart';
import 'package:click_app/src/presentation/pages/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final langController = Get.put(LanguageListController());
    String _selectedLanguage = langController.getLanguage();

    return Center(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Click_App',
        themeMode: ThemeMode.light,
        darkTheme: buildDarkTheme(),
        theme: buildDarkTheme(),
        translations: TranslationApp(),
        locale: Locale(_selectedLanguage),
        textDirection: TextDirection.ltr,
        fallbackLocale: Locale('en'),
        initialRoute: SplashPage.id,
        getPages: AppRoutes.onGenerateRoutes(),
      ),
    );
  }
}
