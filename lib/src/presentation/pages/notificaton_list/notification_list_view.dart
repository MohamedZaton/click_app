import 'package:click_app/src/core/utils/colors.dart';
import 'package:click_app/src/core/utils/constants.dart';
import 'package:click_app/src/core/utils/images_path.dart';
import 'package:click_app/src/presentation/getx/notification_list_controller.dart';
import 'package:click_app/src/presentation/pages/home/home_view.dart';
import 'package:click_app/src/presentation/widgets/message_img_btn_widget.dart';
import 'package:click_app/src/presentation/widgets/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/screens.dart';

class NotificationListView extends StatelessWidget {
  final logic = Get.put(NotificationListController());

  static const String id = "/notification_list";

  NotificationListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.off(() => HomePage());
              },
              icon: Icon(Icons.arrow_back)),
          title: Row(
            children: [
              Icon(
                Icons.notifications,
                color: kOrangeColor,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                kNotificationTxt,
                style: TextStyle(color: kOrangeColor),
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (logic.notificationList.value.isNotEmpty) ...[
              Expanded(
                child: Container(
                  height: ScreenDevices.heigth(context) * 0.80,
                  padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: logic.notificationList.value.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          NotificationItemWidget(
                              notificationModel:
                                  logic.notificationList.value[index]),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ] else if (logic.notificationList.value.isEmpty &&
                !logic.isLoading.value) ...[
              Expanded(
                child: MessageImgButtonWdgt(
                    title: kNoServicesListTxt.tr, imageUrl: kEmptyImg),
              )
            ] else ...[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            ],
          ],
        ),
      );
    });
  }
}
/*
    PrizeCard(
      logoPath: kPrizeAImg,
      title: kPrizeTitleTxt.tr,
      body: kBodyDemoTxt.tr,
    ),
*/
