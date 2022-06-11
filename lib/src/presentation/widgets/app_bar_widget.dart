import 'package:click_app/src/core/utils/colors.dart';
import 'package:click_app/src/core/utils/screens.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: ScreenWeb.width(context) * 0.02,
          right: ScreenWeb.width(context) * 0.02,
          top: ScreenWeb.width(context) * 0.08),
      color: kLightAccent,
      height: ScreenWeb.heigth(context) * 0.10,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu_outlined,
                    color: kOrangeColor,
                    size: 40,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none_rounded,
                    color: kOrangeColor,
                    size: 40,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
