import 'package:carousel_slider/carousel_slider.dart';
import 'package:click_app/src/core/utils/colors.dart';
import 'package:click_app/src/core/utils/screens.dart';
import 'package:click_app/src/presentation/pages/payment_countries/pay_countries_view.dart';
import 'package:click_app/src/presentation/widgets/currency_data_widget.dart';
import 'package:click_app/src/presentation/widgets/flux_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/images_path.dart';
import '../../../core/utils/styles.dart';
import '../../getx/currency_exchange_controller.dart';
import '../../widgets/oval_btn_widget.dart';
import '../language_list/language_list_controller.dart';
import '../payment_countries/pay_university_view.dart';

class CurrencyExchangePage extends StatelessWidget {
  static const String id = "/currencyExchange";
  final logic = Get.put(CurrencyExchangeController());

  @override
  Widget build(BuildContext context) {
    final langController = Get.put(LanguageListController());
    String _selectedLanguage = langController.selectedLang;
    return SingleChildScrollView(
      child: Obx(() {
        return Container(
          width: ScreenDevices.width(context),
          height: ScreenDevices.heigth(context) * 0.75,
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
                    width: ScreenDevices.width(context),
                    child: (logic.adsList.length > 0)
                        ? CarouselSliderListWidget(
                            itemList: logic.adsList.map((item) {
                              return Builder(
                                builder: (context) {
                                  return NewsItemWidget(
                                    imagePath: item.image.toString(),
                                  );
                                },
                              );
                            }).toList(),
                          )
                        : SizedBox(
                            height: 50,
                          )),
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
                        height: ScreenDevices.heigth(context) * 0.50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Flexible(
                              flex: 1,
                              child: Align(
                                alignment: _selectedLanguage != kArabicCode
                                    ? Alignment.topLeft
                                    : Alignment.topRight,
                                child: Text(
                                  kCurrencyExchangeTxt.tr,
                                  textDirection: TextDirection.ltr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(color: kLightAccent),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Flexible(
                              flex: 1,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  /// from currency input
                                  Flexible(
                                    flex: 6,
                                    child: TextField(
                                      decoration: editTextWithBoarderDecoration(
                                          "from ${logic.selectedCountryCurrency.value.code ?? ""}"),
                                      cursorColor: kLightAccent,
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.done,
                                      onChanged: (inputeCurrency) {
                                        logic.inputMoney.value =
                                            (inputeCurrency.isEmpty)
                                                ? 0
                                                : double.parse(inputeCurrency);
                                        logic.checkConvertfromMoneyToRussia(
                                            countryCode: logic
                                                .selectedCountryCurrency
                                                .value
                                                .id!,
                                            inputMoney: logic.inputMoney.value);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),

                                  /// select currency  type
                                  Flexible(
                                    flex: 3,
                                    child: InkWell(
                                      onTap: () {
                                        selectCountryDialog(logic);
                                      },
                                      child: Container(
                                        decoration: decorationBlueBorder,
                                        height: 50,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: kLightAccent,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(19),
                                                  bottomLeft:
                                                      Radius.circular(19),
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
                                            if (logic.currencyList.length >
                                                0) ...[
                                              CurrencyDataWidget(
                                                  dataCurrencyModel: logic
                                                      .selectedCountryCurrency
                                                      .value)
                                            ],
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
                            Flexible(
                              flex: 1,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  // Rub  result
                                  Flexible(
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
                                          Text((logic.outputMoneyRussia.value !=
                                                  "")
                                              ? logic.outputMoneyRussia.value
                                              : "......... "),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  // Rub  result
                                  Flexible(
                                    flex: 3,
                                    child: Container(
                                      width: 200,
                                      decoration: decorationBlueBorder,
                                      child: FluxImage(
                                        imageUrl: kRussiaFlagImg,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Flexible(
                              flex: 1,
                              child: Row(
                                children: [
                                  /// check & pay money buttons
/*                                  Flexible(
                                    flex: 1,
                                    child: OvalButtonWdgt(
                                        text: kCheckTxt.tr,
                                        onPressed: () {
                                          logic.checkConvertfromMoneyToRussia(
                                              countryCode: logic
                                                  .selectedCountryCurrency
                                                  .value
                                                  .id!,
                                              inputMoney:
                                                  logic.inputMoney.value);
                                        }),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),*/
                                  Flexible(
                                    flex: 2,
                                    child: OvalButtonWdgt(
                                        text: kPayUnvMoneyTxt.tr,
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
                            Flexible(
                              flex: 1,
                              child: Row(
                                children: [
                                  /// make transfer button
                                  Flexible(
                                    child: OvalButtonWdgt(
                                        text: kMakeTransferTxt.tr,
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
          children: controller.currencyList
              .map((item) => InkWell(
                  onTap: () {
                    controller.selectCountryCurrency(item);
                    Get.back();
                  },
                  child: CurrencyDataWidget(dataCurrencyModel: item)))
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
      width: ScreenDevices.width(context) * 0.95,
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

class CarouselSliderListWidget extends StatelessWidget {
  List<Widget> itemList;

  CarouselSliderListWidget({
    required this.itemList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayAnimationDuration: Duration(seconds: 2),
        viewportFraction: 1,
        aspectRatio: 1,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: itemList,
    );
  }
}
