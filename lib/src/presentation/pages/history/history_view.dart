import 'package:click_app/src/data/models/transform_model.dart';
import 'package:click_app/src/presentation/pages/history_detail/history_view_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/screens.dart';
import '../../getx/history_controller.dart';
import '../../widgets/history_item_widget.dart';

class HistoryPage extends StatelessWidget {
  final historyController = Get.put(HistoryController());

  static const String id = "/history";

  @override
  Widget build(BuildContext context) {
    List<Widget> _statuePage = [
      TransformListWdgt(
        controller: historyController,
        nameList: kSuccessTxt,
        transformList: historyController.successList.value,
      ),
      TransformListWdgt(
        controller: historyController,
        nameList: kPendingTxt,
        transformList: historyController.pendingList.value,
      ),
      TransformListWdgt(
        controller: historyController,
        nameList: kRejectedTxt,
        transformList: historyController.rejectedList.value,
      ),
    ];
    List<Widget> _titlesToggleButtons = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          kCompletedTxt,
          style: TextStyle(color: kTextDark),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          kPendingTxt,
          style: TextStyle(color: kTextDark),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          kRejectedTxt,
          style: TextStyle(color: kTextDark),
        ),
      ),
    ];

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
                    ToggleButtons(
                      children: _titlesToggleButtons,
                      isSelected: historyController.selectedToggelButton.value,
                      borderRadius: BorderRadius.circular(30),
                      borderColor: kCyanButtonTgColor,
                      selectedColor: kCyanButtonTgColor,
                      fillColor: kCyanColor,
                      onPressed: (int index) {
                        historyController.selectTab(index);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: IndexedStack(
                  index: historyController.tabIndex.value,
                  children: _statuePage),
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
                  height: ScreenWeb.heigth(context) * 0.80,
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
                            money: transformList[index].moneyAmount,
                            idTransform: transformList[index].id,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    },

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
