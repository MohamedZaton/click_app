import 'package:click_app/src/core/utils/screens.dart';
import 'package:click_app/src/data/models/all_models.dart';
import 'package:flutter/material.dart';

import '../../core/utils/colors.dart';

class NotificationItemWidget extends StatelessWidget {
  final NotificationModel notificationModel;
  NotificationItemWidget({Key? key, required this.notificationModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: ScreenDevices.width(context) * 0.9,
      height: ScreenDevices.width(context) * 0.2,
      decoration: BoxDecoration(
        color: kPrizeCardBkgdColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: Text(
              notificationModel.title.toString(),
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: kDarkAccent),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FittedBox(
            child: Wrap(
              children: [
                Text(
                  notificationModel.body.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
