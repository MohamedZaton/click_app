import 'package:click_app/src/data/models/all_models.dart';
import 'package:click_app/src/presentation/pages/history_detail/history_view_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/images_path.dart';
import '../../../core/utils/screens.dart';
import '../../getx/history_controller.dart';
import '../../widgets/history_item_widget.dart';
import '../../widgets/message_img_btn_widget.dart';
import '../../widgets/toggle_button.dart';

class HistoryPage extends StatelessWidget {
  final historyController = Get.put(HistoryController());

  static const String id = "/history";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenDevices.width(context),
      height: ScreenDevices.heigth(context) * 0.80,
      color: Colors.white,
      child: Obx(() {
        //Map <String, dynamic>  transformMap = historyController.transformMap.value ;

        return Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: kLightAccent,
                width: ScreenDevices.width(context),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ToggleButton(
                      width: ScreenDevices.width(context) * 0.9,
                      height: 40.0,
                      toggleBackgroundColor: kCyanColor,
                      toggleBorderColor: kLightAccent,
                      toggleColor: kCyanButtonTgColor,
                      activeTextColor: kTextDark,
                      inactiveTextColor: kTextDark,
                      leftDescription: kPendingTxt.tr,
                      middleDescription: kRejectedTxt.tr,
                      rightDescription: kCompletedTxt.tr,
                      onLeftToggleActive: () {
                        print('left toggle activated');
                        historyController.selectTab(0);
                      },
                      onMiddleToggleActive: () {
                        print('middle toggle activated');
                        historyController.selectTab(1);
                      },
                      onRightToggleActive: () {
                        print('right toggle activated');
                        historyController.selectTab(2);
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
                      controller: historyController,
                      nameList: Status.PENDING.name,
                      transformList: historyController.pendingList.value,
                    ),
                    TransformListWdgt(
                      controller: historyController,
                      nameList: Status.REJECTED.name,
                      transformList: historyController.rejectedList.value,
                    ),
                    TransformListWdgt(
                      controller: historyController,
                      nameList: Status.COMPLETED.name,
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
  final List<TransactionsListModel> transformList;
  final HistoryController controller;
  TransformListWdgt({
    Key? key,
    required this.controller,
    required this.nameList,
    required this.transformList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenDevices.width(context),
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
                if (transformList.length > 0) ...[
                  Container(
                    height: ScreenDevices.heigth(context) * 0.80,
                    padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: transformList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            ItemHistoryWidget(
                              onPress: () {
                                controller.changeClickItem(
                                    nameList, transformList[index]);
                                Get.to(() => HistoryDetailPage());
                              },
                              money:
                                  transformList[index].moneyAmount.toString(),
                              idTransform: transformList[index].id!,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      },
                    ),
                  )
                ] else ...[
                  Container(
                    height: ScreenDevices.heigth(context) * 0.80,
                    padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                    child: MessageImgButtonWdgt(
                        title: kNoListTxt.tr, imageUrl: kEmptyImg),
                  )
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }
}
