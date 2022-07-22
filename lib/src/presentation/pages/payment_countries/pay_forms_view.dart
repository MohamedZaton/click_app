import 'package:click_app/src/core/utils/screens.dart';
import 'package:click_app/src/data/models/all_models.dart';
import 'package:click_app/src/presentation/widgets/oval_btn_widget.dart';
import 'package:click_app/src/presentation/widgets/upload_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/styles.dart';
import '../../getx/pay_countries_controller.dart';

class PayFormsPage extends StatelessWidget {
  PayFormsPage({Key? key}) : super(key: key);
  final logic = Get.put(PaymentCountriesController());
  static const String id = "/payForms";
  TextEditingController amountMoneyController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController bankNumberController = TextEditingController();
  final _formUniversityPaynKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kFormPayTxt.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: GetBuilder<PaymentCountriesController>(builder: (logic) {
            String rateMoneyValue = logic.countryRubRate.toString();

            return Container(
              alignment: Alignment.center,
              width: ScreenDevices.width(context),
              child: Form(
                key: _formUniversityPaynKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    UploadingImgButtonWdgt(
                      nameBtn: kChooseConfirmationMessageImageTxt.tr,
                      onPress: () async {
                        await logic.getConfImage();
                      },
                      imageFile: logic.confImage,
                      isAttachedImage: logic.isAttachedConfImage,
                    ),

                    SizedBox(height: spacing_middle),

                    /// amount of money
                    TextField(
                      decoration: editTextWithBoarderDecoration(
                          kAmountOfMoneyTxt.tr,
                          thickness: 2.0),
                      cursorColor: kLightAccent,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      controller: amountMoneyController,
                    ),
                    SizedBox(height: spacing_middle),

                    /// Russian ruble rate today
                    Container(
                      decoration: decorEggsBlueBoarder,
                      width: ScreenDevices.width(context),
                      height: ScreenDevices.heigth(context) * 0.08,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: spacing_middle,
                          ),
                          Text(
                            kRussianRubleRateTodayTxt.tr + " :",
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
                      decoration: editTextWithBoarderDecoration(
                          kBankAccountNameTxt.tr,
                          thickness: 2.0),
                      cursorColor: kLightAccent,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      controller: bankNameController,
                    ),
                    SizedBox(height: spacing_middle),

                    /// k Bank Account Number
                    TextField(
                      decoration: editTextWithBoarderDecoration(
                          kBankAccountNumberTxt.tr,
                          thickness: 2.0),
                      cursorColor: kLightAccent,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      controller: bankNumberController,
                    ),
                    SizedBox(height: spacing_middle),

                    /// confirm button
                    OvalButtonWdgt(
                        text: kConfirmTxt.tr,
                        onPressed: () {
                          bool isAllAttached = logic.isAttachedConfImage;
                          bool isAllTextFill =
                              amountMoneyController.text.isNotEmpty &&
                                  bankNameController.text.isNotEmpty &&
                                  bankNumberController.text.isNotEmpty;
                          if (!isAllAttached) {
                            Get.snackbar(kUniversityPayTxt,
                                "you must attached all images ",
                                backgroundColor: Colors.deepOrange);
                            return;
                          }
                          if (!isAllTextFill) {
                            Get.snackbar(kUniversityPayTxt,
                                "you must write all information ",
                                backgroundColor: Colors.deepOrange);
                            return;
                          }

                          if (_formUniversityPaynKey.currentState!.validate()) {
                            logic.paymentForm(TransactionModel(
                              moneyAmount: amountMoneyController.text,
                              bankAccountName: bankNameController.text,
                              bankAccountNumber: bankNumberController.text,
                            ));
                          }
                        }),
                    SizedBox(height: spacing_middle),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
