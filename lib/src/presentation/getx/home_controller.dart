import 'package:click_app/src/presentation/getx/prizes_controller.dart';
import 'package:click_app/src/presentation/getx/setting_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

import 'currency_exchange_controller.dart';
import 'history_controller.dart';

class HomeController extends GetxController {
  var tabIndex = 0;
  final prizeLogic = Get.find<PrizesController>();
  final historyLogic = Get.find<HistoryController>();
  final settingLogic = Get.find<SettingController>();
  final exchangeLogic = Get.find<CurrencyExchangeController>();
  void changeTabIndex(int index) {
    tabIndex = index;
    switch (index) {
      case 0:
        {
          exchangeLogic.adsList();
          exchangeLogic.currencyList();
          break;
        }
      case 1:
        {
          prizeLogic.servicesList();
          break;
        }
      case 2:
        {
          historyLogic.fetchTransactionsList();
          break;
        }
    }
    update();
  }

  Future<void> preparationFCM() async {
    /// notification permission /..
    final messaging = FirebaseMessaging.instance;

    final settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (kDebugMode) {
      print('Permission granted: ${settings.authorizationStatus}');
    }

    /// notification permission  .../

    String? token = await messaging.getToken();

    if (kDebugMode) {
      print('Registration Token=$token');
    }
  }

  @override
  void onInit() async {
    super.onInit();
//    await preparationFCM();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
// used to pass messages from event handler to the UI
    final _messageStreamController = BehaviorSubject<RemoteMessage>();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('Handling a foreground message: ${message.messageId}');
        print('Message data: ${message.data}');
        print('Message notification: ${message.notification?.title}');
        print('Message notification: ${message.notification?.body}');
      }

      _messageStreamController.sink.add(message);
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
