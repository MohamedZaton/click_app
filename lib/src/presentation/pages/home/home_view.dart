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

class HomePage extends StatelessWidget {
  static const String id = "/home";

  final logic = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    double? targetValue = 1.0;

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
          height: 100,
          color: kLightAccent,
          child: CurvedNavigationBar(
            backgroundColor: Colors.white,
            buttonBackgroundColor: kOrangeColor,
            color: kLightAccent,
            items: [
              FluxImage(imageUrl: kHomeIcon, color: Colors.white),
              FluxImage(imageUrl: kPrizeIcon, color: Colors.white),
              FluxImage(imageUrl: kLogIcon, color: Colors.white),
              FluxImage(imageUrl: kSettingIcon, color: Colors.white),
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
