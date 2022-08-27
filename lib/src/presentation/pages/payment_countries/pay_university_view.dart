import 'package:click_app/src/data/models/all_models.dart';
import 'package:click_app/src/presentation/getx/currency_exchange_controller.dart';
import 'package:click_app/src/presentation/getx/pay_countries_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/screens.dart';
import '../../../core/utils/styles.dart';
import '../../widgets/oval_btn_widget.dart';
import '../../widgets/upload_button_widget.dart';

class PayUniversityPage extends StatelessWidget {
  final exchangeLogic = Get.put(CurrencyExchangeController());
  final logic = Get.put(PaymentCountriesController());
  static const String id = "/payUniversity";
  TextEditingController amountMoneyController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController bankNumberController = TextEditingController();
  final _formUniversityPaynKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kUniversityPayTxt.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: GetBuilder<PaymentCountriesController>(builder: (logic) {
            String rateMoneyValue = logic.countryRubRate!;

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
                    UploadingImgButtonWdgt(
                      nameBtn: kChoosePassportImageTxt.tr,
                      onPress: () async {
                        await logic.getPassportImage();
                      },
                      imageFile: logic.passportImage,
                      isAttachedImage: logic.isAttachedPassportImage,
                    ),
                    SizedBox(height: spacing_middle),
                    UploadingImgButtonWdgt(
                      nameBtn: kChooseYourIdImageTxt.tr,
                      onPress: () async {
                        await logic.getIdImage();
                      },
                      imageFile: logic.idImage,
                      isAttachedImage: logic.isAttachedIdImage,
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
                    /// confirm button
                    if (logic.isLoading) ...[
                      Row(
                        children: [CircularProgressIndicator()],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ] else ...[
                      OvalButtonWdgt(
                          text: kConfirmTxt.tr,
                          onPressed: () {
                            bool isAllAttached = logic.isAttachedConfImage &&
                                logic.isAttachedConfImage &&
                                logic.isAttachedConfImage;
                            if (!isAllAttached) {
                              Get.snackbar(kUniversityPayTxt,
                                  "you must attached all images ",
                                  backgroundColor: Colors.deepOrange);
                              return;
                            }
                            bool isAllTextFill =
                                amountMoneyController.text.isNotEmpty &&
                                    bankNameController.text.isNotEmpty &&
                                    bankNumberController.text.isNotEmpty;
                            if (!isAllTextFill) {
                              Get.snackbar(kUniversityPayTxt,
                                  "you must write all information ",
                                  backgroundColor: Colors.deepOrange);
                              return;
                            }

                            if (_formUniversityPaynKey.currentState!
                                .validate()) {
                              logic.payUniversityRequest(UniversityPaymentModel(
                                moneyAmount: amountMoneyController.text,
                                bankAccountName: bankNameController.text,
                                bankAccountNumber: bankNumberController.text,
                              ));
                            }
                          }),
                    ],
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
