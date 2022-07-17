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
  String? updateName, updatePhone, updateEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kProfileTxt.tr),
        centerTitle: true,
        backgroundColor: kLightAccent,
      ),
      body: Obx(() {
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
                  if (controller.isLoading.value) ...[
                    CircularProgressIndicator(
                      color: kDarkAccent,
                    ),
                  ] else ...[
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      (controller.isAttachedProfile.value ==
                                              false)
                                          ? FluxImage(
                                              imageUrl: controller
                                                  .dataProfileModel
                                                  .value
                                                  .photo!,
                                              width: 100,
                                              height: 150,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.file(
                                              controller.imageProfile.value,
                                              scale: 2,
                                              fit: BoxFit.cover,
                                            ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 50,
                                        width: 50,
                                        child: FloatingActionButton(
                                          backgroundColor: kCyanColor,
                                          child: Icon(
                                            Icons.add_a_photo_rounded,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            controller.getImage();
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  OvalButtonWdgt(
                                      text: controller
                                          .dataProfileModel.value.name!,
                                      imagePath: kEditImg,
                                      isCenter: false,
                                      backgroundColor: kPrizeCardBkgdColor,
                                      textColor: kSettingListColor,
                                      onPressed: () {
                                        controller.updateNameDg(
                                          title: 'Update Name',
                                          titleField: 'Write new Name ',
                                          onChangedV: (value) {
                                            controller.dataProfileModel.value
                                                .name = value;
                                          },
                                        );
                                      }),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  OvalButtonWdgt(
                                      text: controller
                                          .dataProfileModel.value.phone!,
                                      imagePath: kEditImg,
                                      isCenter: false,
                                      backgroundColor: kPrizeCardBkgdColor,
                                      textColor: kSettingListColor,
                                      onPressed: () {
                                        controller.updateNameDg(
                                          title: 'Update phone',
                                          titleField: 'Write new phone ',
                                          onChangedV: (value) {
                                            controller.dataProfileModel.value
                                                .phone = value;
                                          },
                                        );
                                      }),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  OvalButtonWdgt(
                                      text: controller
                                          .dataProfileModel.value.email!,
                                      imagePath: kEditImg,
                                      isCenter: false,
                                      backgroundColor: kPrizeCardBkgdColor,
                                      textColor: kSettingListColor,
                                      onPressed: () {
                                        controller.updateNameDg(
                                          title: 'Update email',
                                          titleField: 'Write new email ',
                                          onChangedV: (value) {
                                            controller.dataProfileModel.value
                                                .phone = value;
                                          },
                                        );
                                      }),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  OvalButtonWdgt(
                                      text: kSaveTxt.tr.toUpperCase(),
                                      textColor: Colors.white,
                                      onPressed: () {
                                        print(
                                            "[new update Data ] : ${controller.dataProfileModel.value.toJson().toString()}");
                                        controller.putProfileInfo();
                                      }),
                                ]),
                          ),
                        )
                      ],
                    ),
                  ]
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
