import 'package:click_app/src/presentation/pages/payment_countries/pay_details_view.dart';
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
        title: Text(kChooseCountryTxt),
        centerTitle: true,
        backgroundColor: kLightAccent,
      ),
      body: Container(
        width: ScreenWeb.width(context),
        height: ScreenWeb.heigth(context) * 0.80,
        color: kLightAccent,
        child: Container(
          margin: EdgeInsets.only(top: 30),
          width: ScreenWeb.width(context),
          height: ScreenWeb.heigth(context) * 0.80,
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
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              OvalButtonWdgt(
                                  text: kEgyptTxt,
                                  imagePath: kEgyptFlagImg,
                                  isCenter: false,
                                  backgroundColor: kLightAccent,
                                  textColor: Colors.white,
                                  onPressed: () {
                                    Get.to(() => PayDetailsPage());
                                  }),
                              SizedBox(
                                height: 8,
                              ),
                              OvalButtonWdgt(
                                  text: kUaeTxt,
                                  imagePath: kUaeFlagImg,
                                  isCenter: false,
                                  backgroundColor: kLightAccent,
                                  textColor: Colors.white,
                                  onPressed: () {
                                    Get.to(() => PayDetailsPage(
                                          nameCountry: kUaeTxt,
                                          flagPath: kUaeFlagImg,
                                        ));
                                  }),
                              SizedBox(
                                height: 8,
                              ),
                              OvalButtonWdgt(
                                  text: kSaudiArabiaTxt,
                                  imagePath: kKsaFlagImg,
                                  isCenter: false,
                                  backgroundColor: kLightAccent,
                                  textColor: Colors.white,
                                  onPressed: () {
                                    Get.to(() => PayDetailsPage(
                                          nameCountry: kSaudiArabiaTxt,
                                          flagPath: kKsaFlagImg,
                                        ));
                                  }),
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
                                  text: kContactUsTxt,
                                  imagePath: kWhatsAppImg,
                                  isCenter: false,
                                  backgroundColor: kLightAccent,
                                  textColor: Colors.white,
                                  onPressed: () {}),
                            ]),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
