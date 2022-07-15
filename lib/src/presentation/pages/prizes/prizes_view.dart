import 'package:carousel_slider/carousel_slider.dart';
import 'package:click_app/src/core/utils/constants.dart';
import 'package:click_app/src/core/utils/images_path.dart';
import 'package:click_app/src/presentation/widgets/message_img_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';
import '../../getx/prizes_controller.dart';
import '../../widgets/prize_card.dart';

class PrizesPage extends StatelessWidget {
  final logic = Get.put(PrizesController());

  static const String id = "/prizes";

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 20,
              color: kLightAccent,
            ),
            if (logic.servicesList.value.isNotEmpty) ...[
              Expanded(
                child: Container(
                    child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(seconds: 2),
                    viewportFraction: 1,
                    aspectRatio: 1,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: logic.servicesList.value.map((item) {
                    return Builder(builder: (context) {
                      return PrizeCard(
                        logoPath: item.logo ?? kPrizeAImg,
                        title: item.titleEn.toString(),
                        body: item.descriptionEn.toString(),
                      );
                    });
                  }).toList(),
                )),
              ),
            ] else if (logic.servicesList.value.isEmpty &&
                !logic.isLoading.value) ...[
              Expanded(
                child: MessageImgButtonWdgt(
                    title: kNoServicesListTxt.tr, imageUrl: kEmptyImg),
              )
            ] else ...[
              Expanded(child: CircularProgressIndicator()),
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
