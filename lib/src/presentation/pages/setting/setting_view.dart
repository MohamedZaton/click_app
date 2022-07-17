import 'package:click_app/src/core/utils/colors.dart';
import 'package:click_app/src/core/utils/images_path.dart';
import 'package:click_app/src/core/utils/screens.dart';
import 'package:click_app/src/presentation/pages/language_list/language_list_view.dart';
import 'package:click_app/src/presentation/pages/profile/profile_view.dart';
import 'package:click_app/src/presentation/widgets/custom_dailogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants.dart';
import '../../getx/setting_controller.dart';
import '../../widgets/oval_btn_widget.dart';

class SettingPage extends StatelessWidget {
  final logic = Get.put(SettingController());
  static const String id = "/settings";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (logic) {
      return Container(
        width: ScreenDevices.width(context),
        height: ScreenDevices.heigth(context) * 0.80,
        color: kLightAccent,
        child: Container(
          margin: EdgeInsets.only(top: 30),
          width: ScreenDevices.width(context),
          height: ScreenDevices.heigth(context) * 0.80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
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
                              OvalButtonWdgt(
                                  text: kProfileTxt.tr,
                                  imagePath: kProfileImg,
                                  isCenter: false,
                                  backgroundColor: kCyanColor,
                                  textColor: kSettingListColor,
                                  onPressed: () {
                                    Get.to(() => ProfilePage());
                                  }),
                              SizedBox(
                                height: 8,
                              ),
                              OvalButtonWdgt(
                                  text: kLanguageTxt.tr,
                                  imagePath: kLanguageImg,
                                  isCenter: false,
                                  backgroundColor: kCyanColor,
                                  textColor: kSettingListColor,
                                  onPressed: () {
                                    Get.to(() => LanguageListPage());
                                  }),
                              SizedBox(
                                height: 8,
                              ),
                              OvalButtonWdgt(
                                  text: kContactUsTxt.tr,
                                  imagePath: kContactUsImg,
                                  isCenter: false,
                                  backgroundColor: kCyanColor,
                                  textColor: kSettingListColor,
                                  onPressed: () {
                                    if (logic.numbersWatsappList.length > 0) {
                                      CustomDialogs.whatsAppDialog(
                                          context, logic.numbersWatsappList);
                                    } else {
                                      Get.snackbar(
                                          kContactUsTxt.tr, "Not found");
                                    }
                                  }),
                              SizedBox(
                                height: 8,
                              ),
                              OvalButtonWdgt(
                                  text: kShareAppTxt.tr,
                                  imagePath: kShareAppImg,
                                  isCenter: false,
                                  backgroundColor: kCyanColor,
                                  textColor: kSettingListColor,
                                  onPressed: () {}),
                              SizedBox(
                                height: 8,
                              ),
                              OvalButtonWdgt(
                                  text: kRateAppTxt.tr,
                                  imagePath: kRateImg,
                                  isCenter: false,
                                  backgroundColor: kCyanColor,
                                  textColor: kSettingListColor,
                                  onPressed: () {}),
                              SizedBox(
                                height: 8,
                              ),
                              OvalButtonWdgt(
                                  text: kAboutAppTxt.tr,
                                  imagePath: kAboutImg,
                                  isCenter: false,
                                  backgroundColor: kCyanColor,
                                  textColor: kSettingListColor,
                                  onPressed: () {}),
                              SizedBox(
                                height: 8,
                              ),
                              OvalButtonWdgt(
                                  text: kLogOutTxt.tr.toUpperCase(),
                                  textColor: Colors.white,
                                  onPressed: () {
                                    logic.logOutProcess();
                                  }),
                            ]),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
