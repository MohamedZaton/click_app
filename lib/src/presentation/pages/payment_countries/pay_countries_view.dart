import 'package:click_app/src/presentation/widgets/custom_dailogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/images_path.dart';
import '../../../core/utils/screens.dart';
import '../../getx/pay_countries_controller.dart';
import '../../widgets/oval_btn_widget.dart';

class PaymentCountriesPage extends StatelessWidget {
  final logic = Get.put(PaymentCountriesController());
  static const String id = "/paymentCountriesPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kChooseCountryTxt.tr),
        centerTitle: true,
        backgroundColor: kLightAccent,
      ),
      body: Container(
        width: ScreenDevices.width(context),
        height: ScreenDevices.heigth(context) * 0.80,
        color: kLightAccent,
        child: GetBuilder<PaymentCountriesController>(builder: (logic) {
          return Container(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                        width: ScreenDevices.width(context) * 0.9,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                if (logic.countryList.length > 0) ...[
                                  Container(
                                    height: ScreenDevices.heigth(context) *
                                        (logic.countryList.length * 0.1),
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: logic.countryList.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: ScreenDevices.heigth(
                                                      context) *
                                                  0.01),
                                          child: OvalButtonWdgt(
                                              text: logic
                                                  .countryList[index].nameEn!,
                                              imagePath: logic
                                                  .countryList[index].flag!,
                                              isCenter: false,
                                              backgroundColor: kLightAccent,
                                              textColor: Colors.white,
                                              onPressed: () {
                                                logic
                                                    .getSingleCountryAndGoDetails(
                                                        logic.countryList[index]
                                                            .id!);
                                              }),
                                        );
                                      },
                                    ),
                                  )
                                ],
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Or",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                OvalButtonWdgt(
                                    text: kContactUsTxt.tr,
                                    imagePath: kWhatsAppImg,
                                    isCenter: false,
                                    backgroundColor: kLightAccent,
                                    textColor: Colors.white,
                                    onPressed: () {
                                      if (logic.numbersWatsappList.length > 0) {
                                        CustomDialogs.whatsAppDialog(
                                            context, logic.numbersWatsappList);
                                      } else {
                                        Get.snackbar(
                                            kContactUsTxt.tr, "Not found");
                                      }
                                    }),
                                if (logic.isLoading) ...[
                                  Container(
                                    child: CircularProgressIndicator(
                                        color: kDarkAccent),
                                  )
                                ]
                              ]),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
