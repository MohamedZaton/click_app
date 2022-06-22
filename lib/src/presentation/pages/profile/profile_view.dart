import 'package:click_app/src/presentation/widgets/flux_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/images_path.dart';
import '../../../core/utils/screens.dart';
import '../../widgets/oval_btn_widget.dart';
import 'profile_controller.dart';

class ProfilePage extends StatelessWidget {
  final controller = Get.put(ProfileController());
  static const String id = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kProfileTxt),
        centerTitle: true,
        backgroundColor: kLightAccent,
      ),
      body: Container(
        width: ScreenWeb.width(context),
        height: ScreenWeb.heigth(context) * 0.80,
        color: kLightAccent,
        child: Container(
          margin: EdgeInsets.only(top: 30),
          width: ScreenWeb.width(context),
          height: ScreenWeb.heigth(context) * 0.80,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Stack(
                                children: [
                                  ClipOval(
                                    child: SizedBox.fromSize(
                                        size: Size.fromRadius(48),
                                        child: FluxImage(
                                            imageUrl: kProfileDemoImg)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              OvalButtonWdgt(
                                  text: kNameDemoText,
                                  imagePath: kEditImg,
                                  isCenter: false,
                                  backgroundColor: kPrizeCardBkgdColor,
                                  textColor: kSettingListColor,
                                  onPressed: () {}),
                              SizedBox(
                                height: 8,
                              ),
                              OvalButtonWdgt(
                                  text: kPhoneDemoText,
                                  imagePath: kEditImg,
                                  isCenter: false,
                                  backgroundColor: kPrizeCardBkgdColor,
                                  textColor: kSettingListColor,
                                  onPressed: () {}),
                              SizedBox(
                                height: 8,
                              ),
                              OvalButtonWdgt(
                                  text: kEmailDemoText,
                                  imagePath: kEditImg,
                                  isCenter: false,
                                  backgroundColor: kPrizeCardBkgdColor,
                                  textColor: kSettingListColor,
                                  onPressed: () {}),
                              SizedBox(
                                height: 8,
                              ),
                              OvalButtonWdgt(
                                  text: kAboutAppTxt,
                                  imagePath: kEditImg,
                                  isCenter: false,
                                  backgroundColor: kPrizeCardBkgdColor,
                                  textColor: kSettingListColor,
                                  onPressed: () {}),
                              SizedBox(
                                height: 8,
                              ),
                              OvalButtonWdgt(
                                  text: kSaveTxt.toUpperCase(),
                                  textColor: Colors.white,
                                  onPressed: () {}),
                            ]),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
