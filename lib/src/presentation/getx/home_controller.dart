import 'package:click_app/src/presentation/getx/prizes_controller.dart';
import 'package:click_app/src/presentation/getx/setting_controller.dart';
import 'package:get/get.dart';

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

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
