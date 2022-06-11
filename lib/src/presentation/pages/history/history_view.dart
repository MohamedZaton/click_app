import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/screens.dart';
import '../../getx/history_controller.dart';
import '../../widgets/history_item_widget.dart';
import '../../widgets/toggle_button.dart';

class HistoryPage extends StatelessWidget {
  final logic = Get.put(HistoryController());

  static const String id = "/history";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenWeb.width(context),
      height: ScreenWeb.heigth(context) * 0.80,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 50,
            color: kLightAccent,
            width: ScreenWeb.width(context),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ToggleButton(
                  width: 300.0,
                  height: 40.0,
                  toggleBackgroundColor: kCyanColor,
                  toggleBorderColor: kLightAccent,
                  toggleColor: kCyanButtonTgColor,
                  activeTextColor: kTextDark,
                  inactiveTextColor: kTextDark,
                  leftDescription: kPendingTxt,
                  rightDescription: kCompletedTxt,
                  onLeftToggleActive: () {
                    print('left toggle activated');
                  },
                  onRightToggleActive: () {
                    print('right toggle activated');
                  },
                )
              ],
            ),
          ),
          Container(
            width: ScreenWeb.width(context),
            height: ScreenWeb.heigth(context) * 0.71,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ItemHistoryWidget(
                                  creditCode: 2970115121617,
                                  money: 2000,
                                  onPress: () {},
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                ItemHistoryWidget(
                                  creditCode: 2970115121617,
                                  money: 2000,
                                  onPress: () {},
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                ItemHistoryWidget(
                                  creditCode: 2970115121617,
                                  money: 2000,
                                  onPress: () {},
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                ItemHistoryWidget(
                                  creditCode: 2970115121617,
                                  money: 2000,
                                  onPress: () {},
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                ItemHistoryWidget(
                                  creditCode: 2970115121617,
                                  money: 2000,
                                  onPress: () {},
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                ItemHistoryWidget(
                                  creditCode: 2970115121617,
                                  money: 2000,
                                  onPress: () {},
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                ItemHistoryWidget(
                                  creditCode: 2970115121617,
                                  money: 2000,
                                  onPress: () {},
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                              ]),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
