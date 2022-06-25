import 'package:carousel_slider/carousel_slider.dart';
import 'package:click_app/src/core/utils/constants.dart';
import 'package:click_app/src/core/utils/images_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';
import '../../getx/prizes_controller.dart';
import '../../widgets/prize_card.dart';

class PrizesPage extends StatelessWidget {
  final logic = Get.put(PrizesController());
  List<Widget> imageSliders = [
    PrizeCard(
      logoPath: kPrizeAImg,
      title: kPrizeTitleTxt.tr,
      body: kBodyDemoTxt.tr,
    ),
    PrizeCard(
      logoPath: kPrizeAImg,
      title: kPrizeTitleTxt.tr,
      body: kBodyDemoTxt.tr,
    ),
    PrizeCard(
      logoPath: kPrizeAImg,
      title: kPrizeTitleTxt.tr,
      body: kBodyDemoTxt.tr,
    ),
  ];

  static const String id = "/prizes";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 20,
            color: kLightAccent,
          ),
          Expanded(
            child: Container(
                child: CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                aspectRatio: 1,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items: imageSliders,
            )),
          ),
        ],
      ),
    );
  }
}
