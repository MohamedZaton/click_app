import 'dart:io';

import 'package:click_app/src/config/routes/app_routes.dart';
import 'package:click_app/src/config/themes/get_theme.dart';
import 'package:click_app/src/presentation/pages/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Click_App',
        themeMode: ThemeMode.light,
        darkTheme: buildDarkTheme(),
        theme: buildDarkTheme(),
        initialRoute: SplashPage.id,
        getPages: AppRoutes.onGenerateRoutes(),
      ),
    );
  }
}
