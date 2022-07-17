import 'package:click_app/src/presentation/getx/currency_exchange_controller.dart';
import 'package:click_app/src/presentation/getx/history_controller.dart';
import 'package:click_app/src/presentation/getx/prizes_controller.dart';
import 'package:click_app/src/presentation/getx/setting_controller.dart';
import 'package:click_app/src/presentation/pages/currency_exchange/currency_exchange_view.dart';
import 'package:click_app/src/presentation/pages/history/history_view.dart';
import 'package:click_app/src/presentation/pages/prizes/prizes_view.dart';
import 'package:click_app/src/presentation/pages/setting/setting_view.dart';
import 'package:click_app/src/presentation/widgets/app_bar_widget.dart';
import 'package:click_app/src/presentation/widgets/curved_navigation_bar.dart';
import 'package:click_app/src/presentation/widgets/flux_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/images_path.dart';
import '../../getx/home_controller.dart';
import '../language_list/language_list_controller.dart';

class HomePage extends StatelessWidget {
  static const String id = "/home";
  final languageLogic = Get.put(LanguageListController());

  final prizeLogic = Get.put(PrizesController());
  final historyLogic = Get.put(HistoryController());
  final settingLogic = Get.put(SettingController());
  final exchangeLogic = Get.put(CurrencyExchangeController());
  final logic = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(flex: 2, child: AppBarWidget()),
            Expanded(
              flex: 14,
              child: IndexedStack(
                index: controller.tabIndex,
                children: [
                  CurrencyExchangePage(),
                  PrizesPage(),
                  HistoryPage(),
                  SettingPage(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 80,
          color: kLightAccent,
          child: CurvedNavigationBar(
            backgroundColor: Colors.white,
            buttonBackgroundColor: kOrangeColor,
            initialIndex: controller.tabIndex,
            color: kLightAccent,
            items: [
              FluxImage(
                imageUrl: kHomeIcon,
                color: Colors.white,
                width: 15,
                height: 15,
              ),
              FluxImage(
                imageUrl: kPrizeIcon,
                color: Colors.white,
                width: 15,
                height: 15,
              ),
              FluxImage(
                imageUrl: kLogIcon,
                color: Colors.white,
                width: 15,
                height: 15,
              ),
              FluxImage(
                imageUrl: kSettingIcon,
                color: Colors.white,
                width: 15,
                height: 15,
              ),
            ],
            onTap: (index) {
              controller.changeTabIndex(index);
            },
          ),
        ),
      );
    });
  }
}
