import 'dart:io';

import 'package:click_app/src/config/routes/app_routes.dart';
import 'package:click_app/src/config/themes/get_theme.dart';
import 'package:click_app/src/core/languages/translation.dart';
import 'package:click_app/src/presentation/pages/language_list/language_list_controller.dart';
import 'package:click_app/src/presentation/pages/splash/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

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
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, //This line is necessary
  );
  preparationFCM();

  /// Set up  message handler
  _onMessagingOpenAppFCM();
  _onMessagingFCM();

  FirebaseMessaging.onBackgroundMessage(_onMessagingBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final langController = Get.put(LanguageListController());
    String _selectedLanguage = langController.selectedLang;

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

Future<void> _onMessagingBackgroundHandler(RemoteMessage message) async {
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.max,
  );
  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
    print('Message data: ${message.data}');
    print('Message notification: ${message.notification?.title}');
    print('Message notification: ${message.notification?.body}');
  }
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;

  if (notification != null && android != null) {
    flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            icon: "@mipmap/ic_launcher",
            // other properties...
          ),
        ));
  }
}

Future<void> _onMessagingFCM() async {
  FirebaseMessaging.onMessage.listen((event) {
    print("on message FCM");
    Get.snackbar(
      event.notification!.title.toString(),
      event.notification!.body.toString(),
      duration: Duration(minutes: 1),
      backgroundColor: Colors.orange,
    );
  });
}

Future<void> _onMessagingOpenAppFCM() async {
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print("on message FCM");
    Get.snackbar(
      event.notification!.title.toString(),
      event.notification!.body.toString(),
      backgroundColor: Colors.orange,
      duration: Duration(minutes: 1),
    );
  });
}

Future<void> preparationFCM() async {
  final messaging = FirebaseMessaging.instance;

  requestPermission();

  String? token = await messaging.getToken();

  print('Registration Token=$token');
}

void requestPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
}
