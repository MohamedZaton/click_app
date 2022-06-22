import 'package:click_app/src/core/utils/screens.dart';
import 'package:click_app/src/presentation/widgets/oval_btn_widget.dart';
import 'package:click_app/src/presentation/widgets/upload_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/styles.dart';
import '../../getx/pay_countries_controller.dart';
import '../messages/message_view.dart';

class PayFormsPage extends StatelessWidget {
  PayFormsPage({Key? key}) : super(key: key);
  final logic = Get.put(PaymentCountriesController());
  static const String id = "/payForms";
  @override
  Widget build(BuildContext context) {
    String rateMoneyValue = "20 EGP";
    return Scaffold(
      appBar: AppBar(
        title: Text(kFormPayTxt),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            width: ScreenWeb.width(context),
            height: ScreenWeb.heigth(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UploadingButtonWdgt(
                  nameBtn: kChooseConfirmationMessageImageTxt,
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
