import 'package:click_app/src/presentation/getx/pay_countries_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/screens.dart';
import '../../../core/utils/styles.dart';
import '../../widgets/oval_btn_widget.dart';
import '../../widgets/upload_button_widget.dart';
import '../messages/message_view.dart';

class PayUniversityPage extends StatelessWidget {
  final logic = Get.put(PaymentCountriesController());
  static const String id = "/payUniversity";
  @override
  Widget build(BuildContext context) {
    String rateMoneyValue = "20 EGP";
    return Scaffold(
      appBar: AppBar(
        title: Text(kUniversityPayTxt),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            alignment: Alignment.center,
            width: ScreenWeb.width(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UploadingButtonWdgt(
                  nameBtn: kChooseConfirmationMessageImageTxt,
                ),
                SizedBox(height: spacing_middle),
                UploadingButtonWdgt(
                  nameBtn: kChoosePassportImageTxt,
                ),
                SizedBox(height: spacing_middle),
                UploadingButtonWdgt(
                  nameBtn: kChooseYourIdImageTxt,
                ),
                SizedBox(height: spacing_middle),

                /// amount of money
                TextField(
                  decoration: editTextWithBoarderDecoration(kAmountOfMoneyTxt,
                      thickness: 2.0),
                  cursorColor: kLightAccent,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: spacing_middle),

                /// Russian ruble rate today
                Container(
                  decoration: decorEggsBlueBoarder,
                  width: ScreenWeb.width(context),
                  height: ScreenWeb.heigth(context) * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: spacing_middle,
                      ),
                      Text(
                        kRussianRubleRateTodayTxt + " :",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: Colors.grey),
                      ),
                      SizedBox(
                        width: spacing_middle,
                      ),
                      Text(
                        rateMoneyValue,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                SizedBox(height: spacing_middle),

                /// Bank Account Name

                TextField(
                  decoration: editTextWithBoarderDecoration(kBankAccountNameTxt,
                      thickness: 2.0),
                  cursorColor: kLightAccent,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: spacing_middle),

                /// k Bank Account Number
                TextField(
                  decoration: editTextWithBoarderDecoration(
                      kBankAccountNumberTxt,
                      thickness: 2.0),
                  cursorColor: kLightAccent,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: spacing_middle),

                /// confirm button
                OvalButtonWdgt(
                    text: kConfirmTxt,
                    onPressed: () {
                      Get.to(() => MessagesPage());
                    }),
                SizedBox(height: spacing_middle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
