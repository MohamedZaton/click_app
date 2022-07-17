import 'package:click_app/src/core/utils/constants.dart';
import 'package:click_app/src/core/utils/images_path.dart';
import 'package:click_app/src/presentation/getx/pay_countries_controller.dart';
import 'package:click_app/src/presentation/pages/payment_countries/pay_forms_view.dart';
import 'package:click_app/src/presentation/widgets/flux_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/screens.dart';
import '../../../core/utils/styles.dart';
import '../../../data/models/all_models.dart';
import '../../widgets/oval_btn_widget.dart';

class PayDetailsPage extends StatelessWidget {
  final logic = Get.put(PaymentCountriesController());
  static const String id = "/payDetails";

  final DataSingleCountry? dataSingleCountry;

  PayDetailsPage({this.dataSingleCountry});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentCountriesController>(builder: (logic) {
      return Scaffold(
          appBar: AppBar(
            title: Text(
                "${logic.dataSingleCountry.nameEn} -  ${kMakeTransferTxt.tr}"),
          ),
          body: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: ScreenDevices.heigth(context) * 0.75,
                  width: ScreenDevices.width(context) * 0.85,
                  decoration: BoxDecoration(
                    color: kPrizeCardBkgdColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: FluxImage(
                            imageUrl: logic.dataSingleCountry.flag.toString(),
                            fit: BoxFit.fill,
                            width: ScreenDevices.width(context) * 0.6,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Expanded(
                            flex: 1,
                            child: Text(
                              logic.dataSingleCountry.nameEn!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: kDarkAccent),
                            )),
                        Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (logic.dataSingleCountry.contactPhone !=
                                        null) {
                                      Clipboard.setData(ClipboardData(
                                              text: logic.dataSingleCountry
                                                  .contactPhone))
                                          .then((_) {
                                        Get.snackbar(
                                            "Copied", "This number is Copied ",
                                            backgroundColor: Colors.green);
                                      });
                                    }
                                  },
                                  child: Container(
                                    decoration: decorOnlyBlueBoarder,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          logic.dataSingleCountry
                                                  .contactPhone ??
                                              "Not found  number ",
                                          style: TextStyle(
                                              color: kLightAccent,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        FluxImage(imageUrl: kCopyImg)
                                      ],
                                    ),
                                  ),
                                ),
                                Spacer(),
                                if (logic.dataSingleCountry.contactPhone2 !=
                                    null) ...[
                                  InkWell(
                                    onTap: () {
                                      if (logic.dataSingleCountry
                                              .contactPhone2 !=
                                          null) {
                                        Clipboard.setData(ClipboardData(
                                                text: logic.dataSingleCountry
                                                    .contactPhone2))
                                            .then((_) {
                                          Get.snackbar("Copied",
                                              "This number is Copied ",
                                              backgroundColor: Colors.green);
                                        });
                                      }
                                    },
                                    child: Container(
                                      decoration: decorOnlyBlueBoarder,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            logic.dataSingleCountry
                                                    .contactPhone2 ??
                                                "Not found  number ",
                                            style: TextStyle(
                                                color: kLightAccent,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          FluxImage(imageUrl: kCopyImg)
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            )),
                        Spacer(
                          flex: 1,
                        ),
                        Expanded(
                            flex: 2,
                            child: Wrap(runSpacing: 5, children: [
                              Text(logic.dataSingleCountry.descriptionEn!)
                            ])),
                        OvalButtonWdgt(
                            text: kNextTxt.tr.toUpperCase(),
                            textColor: Colors.white,
                            onPressed: () {
                              Get.to(() => PayFormsPage());
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
