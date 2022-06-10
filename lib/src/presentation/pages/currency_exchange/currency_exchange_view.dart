import 'package:click_app/src/core/utils/colors.dart';
import 'package:click_app/src/core/utils/screens.dart';
import 'package:click_app/src/presentation/widgets/flag_country.dart';
import 'package:click_app/src/presentation/widgets/flux_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/images_path.dart';
import '../../../core/utils/styles.dart';
import '../../getx/currency_exchange_controller.dart';
import '../../widgets/oval_btn_widget.dart';

class CurrencyExchangePage extends StatelessWidget {
  final logic = Get.put(CurrencyExchangeController());

  static const String id = "/currencyExchange";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: ScreenWeb.heigth(context) * 0.75,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.white,
                child: Stack(
                  children: [
                    Container(
                      height: 70,
                      color: kLightAccent,
                    ),
                    Positioned(
                      top: 40,
                      left: 70,
                      right: 70,
                      bottom: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: kLightAccent, width: 5.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: FluxImage(
                            imageUrl: kExchangeImg,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: spacing_standard_new),
                child: Container(
                  height: ScreenWeb.heigth(context) * 0.50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                  selectCountryDialog();
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: decorationBlueBorder,
                                    ),
                                    Positioned(
                                      top: 1,
                                      left: 1,
                                      bottom: 1,
                                      child: Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: kOrangeColor,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                          ),
                                        ),
                                        child: FluxImage(
                                            imageUrl: kCurrencyValueImg),
                                      ),
                                    ),
                                  ],
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
                                  borderRadius: BorderRadius.circular(20.0),
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
                                  text: kPayUnvMoneyTxt, onPressed: () {}),
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
                                  text: kMakeTransferText, onPressed: () {}),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> selectCountryDialog() {
    return Get.defaultDialog(
      title: "Select Currency ",
      titleStyle: TextStyle(color: kLightAccent),
      middleTextStyle: TextStyle(color: Colors.black),
      backgroundColor: Colors.white,
      content: Container(
        height: 300,
        width: 100,
        child: ListView(
          children: <Widget>[
            FlagCountryWidget(
              flagImgPath: kEgyptFlagImg,
              name: "EGP",
              onTap: () {
                Get.back();
              },
            ),
            FlagCountryWidget(
              flagImgPath: kKsaFlagImg,
              name: "KSA",
              onTap: () {
                Get.back();
              },
            ),
            FlagCountryWidget(
              flagImgPath: kUaeFlagImg,
              name: "UAE",
              onTap: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
