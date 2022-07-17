import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/utils/colors.dart';
import '../../core/utils/images_path.dart';
import '../../core/utils/screens.dart';
import 'oval_btn_widget.dart';

class CustomDialogs {
  static Future<dynamic> whatsAppDialog(
      BuildContext context, List<String> numbersWatsAppList) {
    return Get.defaultDialog(
      title: "Select WhatsApp Number ",
      titleStyle: TextStyle(color: kLightAccent),
      middleTextStyle: TextStyle(color: Colors.green),
      backgroundColor: Colors.white,
      content: Container(
        height: ScreenDevices.heigth(context) * 0.2,
        width: ScreenDevices.width(context) * 0.8,
        child: ListView(
          children: numbersWatsAppList
              .map(
                (item) => Column(
                  children: [
                    OvalButtonWdgt(
                      text: item,
                      imagePath: kWhatsAppImg,
                      onPressed: () async {
                        var whatsappUrl = "whatsapp://send?phone=$item";
                        await canLaunchUrl(Uri.parse(whatsappUrl))
                            ? launchUrl(Uri.parse(whatsappUrl))
                            : print(
                                "open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
                        Get.back();
                      },
                    ),
                    SizedBox(
                      height: 6,
                    )
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
