import 'package:click_app/src/core/utils/constants.dart';
import 'package:click_app/src/core/utils/images_path.dart';
import 'package:click_app/src/core/utils/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/flux_image.dart';
import 'language_list_controller.dart';

class LanguageListPage extends StatelessWidget {
  final logic = Get.put(LanguageListController());
  static const String id = "/languageListPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kLanguageTxt.tr),
        centerTitle: true,
      ),
      body: GetBuilder<LanguageListController>(
        assignId: true,
        builder: (controller) {
          return Container(
            padding: EdgeInsets.all(10),
            width: ScreenDevices.width(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    controller.chooseLanguage(kArabicCode);
                    Get.updateLocale(Locale(kArabicCode));
                    Get.back();
                  },
                  child: Container(
                    height: 50,
                    child: Row(
                      children: [
                        FluxImage(
                          imageUrl: kEgyptFlagImg,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          kArabicTxt,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.blue),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                InkWell(
                  onTap: () {
                    controller.chooseLanguage(kEnglishCode);
                    Get.updateLocale(Locale(kEnglishCode));
                    Get.back();
                  },
                  child: Container(
                    height: 50,
                    child: Row(
                      children: [
                        FluxImage(
                          imageUrl: kEnglishFlagImg,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          kEnglishTxt,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.blue),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
