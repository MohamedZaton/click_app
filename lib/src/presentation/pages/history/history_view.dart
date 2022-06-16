import 'package:click_app/src/data/models/transform_model.dart';
import 'package:click_app/src/presentation/pages/history_detail/history_view_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/screens.dart';
import '../../getx/history_controller.dart';
import '../../widgets/history_item_widget.dart';
import '../../widgets/toggle_button.dart';

class HistoryPage extends StatelessWidget {
  final historyController = Get.put(HistoryController());

  static const String id = "/history";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenWeb.width(context),
      height: ScreenWeb.heigth(context) * 0.80,
      color: Colors.white,
      child: Obx(() {
        //Map <String, dynamic>  transformMap = historyController.transformMap.value ;

        return Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
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
                        historyController.selectTab(1);
                      },
                      onRightToggleActive: () {
                        print('right toggle activated');
                        historyController.selectTab(1);
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: IndexedStack(
                  index: historyController.tabIndex.value,
                  children: [
                    TransformListWdgt(
                      nameList: kSuccessTxt,
                      transformList: historyController.successList.value,
                    ),
                    TransformListWdgt(
                      nameList: kPendingTxt,
                      transformList: historyController.successList.value,
                    ),
                  ]),
            ),
          ],
        );
      }),
    );
  }
}

class TransformListWdgt extends StatelessWidget {
  final String nameList;
  final List<TransformModel> transformList;
  TransformListWdgt({
    Key? key,
    required this.nameList,
    required this.transformList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenWeb.width(context),
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
                      children: [
                        ItemHistoryWidget(
                          onPress: () {
                            Get.to(() => HistoryDetailPage());
                          },
                          money: transformList[0].moneyAmount,
                          idTransform: transformList[0].id,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ItemHistoryWidget(
                          onPress: () {
                            Get.to(() => HistoryDetailPage());
                          },
                          money: transformList[1].moneyAmount,
                          idTransform: transformList[1].id,
                        )
                      ],
                    ),

                    /*             child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List<ItemHistoryWidget>.from(
                            transformList.map((item) => ItemHistoryWidget(
                                  onPress: () {},
                                  idTransform: item.id,
                                  money: item.moneyAmount,
                                )))),*/
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
