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
import '../../widgets/oval_btn_widget.dart';

class PayDetailsPage extends StatelessWidget {
  final logic = Get.put(PaymentCountriesController());
  static const String id = "/payDetails";

  final String? nameCountry;
  final String? detailsCountry;
  final String? numberCountry;
  final String? flagPath;

  PayDetailsPage(
      {this.nameCountry = "Egypt",
      this.detailsCountry = kBodyDemoSmallTxt,
      this.flagPath = kEgyptFlagImg,
      this.numberCountry = kPhoneDemoText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("$nameCountry -  $kMakeTransferText"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                height: 70,
                color: kLightAccent,
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                height: ScreenWeb.heigth(context) * 0.70,
                width: ScreenWeb.width(context) * 0.8,
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
                          imageUrl: flagPath.toString(),
                          fit: BoxFit.fill,
                          width: ScreenWeb.width(context) * 0.40,
                        ),
                      ),
                      Expanded(flex: 1, child: Text(nameCountry!)),
                      Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              Clipboard.setData(
                                      new ClipboardData(text: numberCountry))
                                  .then((_) {
                                Get.snackbar("Copied", "This number is Copied ",
                                    backgroundColor: Colors.green);
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //     SnackBar(
                                //         content: Text(
                                //             'Copied to your clipboard !')));
                              });
                            },
                            child: Container(
                              decoration: decorOnlyBlueBoarder,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    numberCountry.toString(),
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
                          )),
                      Spacer(
                        flex: 1,
                      ),
                      Expanded(
                          flex: 2,
                          child: Wrap(
                              runSpacing: 5,
                              children: [Text(detailsCountry!)])),
                      OvalButtonWdgt(
                          text: kNextText.toUpperCase(),
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
  }
}
