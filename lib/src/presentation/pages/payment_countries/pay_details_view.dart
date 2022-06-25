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
  final List<String?> numberCountry;
  final String? flagPath;

  PayDetailsPage(
      {this.nameCountry = "Egypt",
      this.detailsCountry = kBodyDemoSmallTxt,
      this.flagPath = kEgyptFlagImg,
      this.numberCountry = const [kPhoneDemoText, kPhoneDemoText + "7"]});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("$nameCountry -  ${kMakeTransferTxt.tr}"),
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
                          imageUrl: flagPath.toString(),
                          fit: BoxFit.fill,
                          width: ScreenDevices.width(context) * 0.40,
                        ),
                      ),
                      Expanded(flex: 1, child: Text(nameCountry!)),
                      Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Clipboard.setData(new ClipboardData(
                                          text: numberCountry[0]))
                                      .then((_) {
                                    Get.snackbar(
                                        "Copied", "This number is Copied ",
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
                                        numberCountry[0].toString(),
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
                              InkWell(
                                onTap: () {
                                  Clipboard.setData(new ClipboardData(
                                          text: numberCountry[1]))
                                      .then((_) {
                                    Get.snackbar(
                                        "Copied", "This number is Copied ",
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
                                        numberCountry[1].toString(),
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
  }
}
