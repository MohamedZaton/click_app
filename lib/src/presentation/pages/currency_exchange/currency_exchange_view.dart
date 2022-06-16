import 'package:carousel_slider/carousel_slider.dart';
import 'package:click_app/src/core/utils/colors.dart';
import 'package:click_app/src/core/utils/screens.dart';
import 'package:click_app/src/presentation/pages/payment_countries/pay_countries_view.dart';
import 'package:click_app/src/presentation/widgets/flag_country.dart';
import 'package:click_app/src/presentation/widgets/flux_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/images_path.dart';
import '../../../core/utils/styles.dart';
import '../../getx/currency_exchange_controller.dart';
import '../../widgets/oval_btn_widget.dart';
import '../payment_countries/pay_university_view.dart';

class CurrencyExchangePage extends StatelessWidget {
  static const String id = "/currencyExchange";
  final logic = Get.put(CurrencyExchangeController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<CurrencyExchangeController>(builder: (controller) {
        return Container(
          width: ScreenWeb.width(context),
          height: ScreenWeb.heigth(context) * 0.75,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 2,
                child: Container(
                    width: ScreenWeb.width(context),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        viewportFraction: 1,
                        aspectRatio: 1,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: [
                        NewsItemWidget(),
                        NewsItemWidget(
                          imagePath: kExchangeTwoImg,
                        ),
                        NewsItemWidget(
                          imagePath: kExchangeThreeImg,
                        ),
                        NewsItemWidget(
                          imagePath: kExchangeTwoImg,
                        ),
                        NewsItemWidget(),
                      ],
                    )),

                /*Container(
                  color: Colors.white,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      NewsItemWidget(),
                      SizedBox(width: 6),
                      NewsItemWidget(
                        imagePath: kExchangeTwoImg,
                      ),
                      SizedBox(width: 6),
                      NewsItemWidget(
                        imagePath: kExchangeThreeImg,
                      ),
                      SizedBox(width: 6),
                      NewsItemWidget(
                        imagePath: kExchangeTwoImg,
                      ),
                      SizedBox(width: 6),
                      NewsItemWidget(),
                      SizedBox(width: 6),
                    ],
                  ),
                )*/
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: spacing_standard_new),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: [
                      Container(
                        height: ScreenWeb.heigth(context) * 0.50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                kCurrencyExchangeTxt,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: kLightAccent),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  /// from currency input
                                  Expanded(
                                    flex: 6,
                                    child: TextField(
                                      decoration:
                                          editTextWithBoarderDecoration("from"),
                                      cursorColor: kLightAccent,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.done,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),

                                  /// select currency  type
                                  Expanded(
                                    flex: 3,
                                    child: InkWell(
                                      onTap: () {
                                        selectCountryDialog(controller);
                                      },
                                      child: Container(
                                        decoration: decorationBlueBorder,
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: kLightAccent,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  bottomLeft:
                                                      Radius.circular(20),
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.arrow_drop_down_outlined,
                                                size: 30,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            FlagCountryWidget(
                                              currencyModel:
                                                  controller.selectedCurrency,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  // Rub  result
                                  Expanded(
                                    flex: 6,
                                    child: Container(
                                      decoration: decorationBlueBorder,
                                      padding: EdgeInsets.all(8),
                                      child: Row(
                                        children: [
                                          Text("RUB =  "),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text("......... "),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  // Rub  result
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: FluxImage(
                                        imageUrl: kRoubleImg,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  /// check & pay money buttons
                                  Expanded(
                                    flex: 1,
                                    child: OvalButtonWdgt(
                                        text: kCheckTxt, onPressed: () {}),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: OvalButtonWdgt(
                                        text: kPayUnvMoneyTxt,
                                        onPressed: () {
                                          Get.to(() => PayUniversityPage());
                                        }),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  /// make transfer button
                                  Expanded(
                                    child: OvalButtonWdgt(
                                        text: kMakeTransferText,
                                        onPressed: () {
                                          Get.to(() => PaymentCountriesPage());
                                        }),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Future<dynamic> selectCountryDialog(CurrencyExchangeController controller) {
    return Get.defaultDialog(
      title: "Select Currency ",
      titleStyle: TextStyle(color: kLightAccent),
      middleTextStyle: TextStyle(color: Colors.black),
      backgroundColor: Colors.white,
      content: Container(
        height: 100,
        width: 100,
        child: ListView(
          children: currencyDemoList
              .map((item) => InkWell(
                  onTap: () {
                    controller.chooseSelected(item);
                    Get.back();
                  },
                  child: FlagCountryWidget(currencyModel: item)))
              .toList(),
        ),
      ),
    );
  }
}

class NewsItemWidget extends StatelessWidget {
  final String? imagePath;

  const NewsItemWidget({
    Key? key,
    this.imagePath = kExchangeImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: kLightAccent, width: 3.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(17.0),
        child: FluxImage(
          imageUrl: imagePath.toString(),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
