import 'package:badges/badges.dart';
import 'package:click_app/src/core/utils/colors.dart';
import 'package:click_app/src/core/utils/screens.dart';
import 'package:click_app/src/presentation/getx/notification_list_controller.dart';
import 'package:click_app/src/presentation/pages/notificaton_list/notification_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/local_data.dart';

class AppBarWidget extends StatelessWidget {
  final notificationLogic = Get.put(NotificationListController());

  AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: EdgeInsets.only(
            left: ScreenDevices.width(context) * 0.02,
            right: ScreenDevices.width(context) * 0.02,
            top: ScreenDevices.width(context) * 0.08),
        color: kLightAccent,
        height: ScreenDevices.heigth(context) * 0.10,
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
/*                IconButton(
                    onPressed: () {
                      Get.to(() => SettingPage());
                    },
                    icon: Icon(
                      Icons.menu_outlined,
                      color: kOrangeColor,
                    )),*/

                  IconButton(
                      onPressed: () async {
                        notificationLogic.isNewNotification.value = false;
                        await LocalData().writeNewNotification(false);

                        Get.to(() => NotificationListView());
                      },
                      icon: Badge(
                        badgeContent: Text(
                          notificationLogic.numNotification.value.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        showBadge: notificationLogic.isNewNotification.value,
                        child: Icon(
                          Icons.notifications_none_rounded,
                          color: kOrangeColor,
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
