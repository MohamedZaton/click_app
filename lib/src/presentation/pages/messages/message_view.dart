import 'package:click_app/src/core/utils/colors.dart';
import 'package:click_app/src/core/utils/screens.dart';
import 'package:click_app/src/presentation/widgets/flux_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/images_path.dart';
import '../../widgets/oval_btn_widget.dart';
import '../home/home_view.dart';

class MessagesPage extends StatelessWidget {
  static const String id = "/messagePage";
  final String? title;
  final String? imgPath;
  final String? nameButton;
  MessagesPage({
    this.title = kAppliedText,
    this.imgPath = kAppliedImg,
    this.nameButton = kDoneTxt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      alignment: Alignment.center,
      width: ScreenWeb.width(context),
      height: ScreenWeb.heigth(context),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: FluxImage(
              imageUrl: kAppliedImg,
              width: ScreenWeb.width(context) * 0.6,
              height: ScreenWeb.heigth(context) * 0.6,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              title!,
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: kLightAccent),
            ),
          ),
          OvalButtonWdgt(
              text: kDoneTxt,
              onPressed: () {
                Get.to(() => HomePage());
              }),
        ],
      ),
    );
  }
}
