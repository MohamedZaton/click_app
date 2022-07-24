import 'package:click_app/src/core/utils/constants.dart';
import 'package:click_app/src/core/utils/images_path.dart';
import 'package:click_app/src/data/models/all_models.dart';
import 'package:click_app/src/presentation/getx/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_countdown/slide_countdown.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/screens.dart';
import '../../widgets/custom_dailogs.dart';
import '../../widgets/flux_image.dart';
import '../../widgets/oval_btn_widget.dart';

class HistoryDetailPage extends StatelessWidget {
  final controller = Get.put(HistoryController());

  static const String id = "/historyDetailPage";

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      Map<String, String> dataMap = controller.selectStatueTitleImageMap.value;
      DataSingleTransactionModel transactionItem =
          controller.singleTransactionItem.value;
/*      int expireMinutes = 2;
      controller.pendingTime.value = TimeHelper()
          .calculateTransactionExpired(createTime: transactionItem.createdAt!);
      int expireReminderMin =
            (expireMinutes * 60) - controller.pendingTime.value;*/

      return Scaffold(
        appBar: AppBar(
          title: Text(transactionItem.status!.toLowerCase()),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: ScreenDevices.heigth(context) * 0.90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Positioned(
                          top: ScreenDevices.heigth(context) * 0.02,
                          left: ScreenDevices.width(context) * 0.07,
                          right: ScreenDevices.width(context) * 0.07,
                          bottom: ScreenDevices.heigth(context) * 0.008,
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: FluxImage(
                                imageUrl: dataMap[transactionItem.status!]!,
                                fit: BoxFit.contain,
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
                    padding:
                        EdgeInsets.symmetric(horizontal: spacing_standard_new),
                    child: Container(
                      height: ScreenDevices.heigth(context) * 0.50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              kCurrencyExchangeTxt.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: kOrangeColor),
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              kCaseTransformTxt.tr + transactionItem.status!,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(color: kDarkGray),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 2,
                          ),

                          /// panding status start
                          if (transactionItem.status ==
                              Status.PENDING.name) ...[
                            if (controller.pendingTime.value > 0) ...[
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FluxImage(
                                      imageUrl: kClockTimerImg,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    SlideCountdownSeparated(
                                      duration: Duration(
                                          minutes:
                                              controller.pendingTime.value),
                                    ),
/*                                  CounterDownTimerWgt(
                                    minutes: controller.pendingTime.value,
                                    onEnd: () {
                                      controller.pendingTime.value = 0;
                                    },
                                  ),*/
                                  ],
                                ),
                              ),
                            ],
                            if (controller.pendingTime.value <= 0) ...[
                              Expanded(
                                  flex: 1,
                                  child: FittedBox(
                                      child: Text(kContactUsDetailsTxt.tr))),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: ScreenDevices.width(context) * 0.7,
                                      height:
                                          ScreenDevices.heigth(context) * 0.1,
                                      child: OvalButtonWdgt(
                                          text: kContactUsTxt.tr,
                                          imagePath: kWhatsAppImg,
                                          isCenter: true,
                                          backgroundColor: kLightAccent,
                                          textColor: Colors.white,
                                          onPressed: () {
                                            if (controller.numbersWatsappList
                                                    .value.length >
                                                0) {
                                              CustomDialogs.whatsAppDialog(
                                                  context,
                                                  controller.numbersWatsappList
                                                      .value);
                                            } else {
                                              Get.snackbar(kContactUsTxt.tr,
                                                  "Not found");
                                            }
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],

                          /// panding status end
                          /// panding status start
                          if (transactionItem.status ==
                              Status.REJECTED.name) ...[
                            FittedBox(
                              child: Text(
                                  "Reason : ${transactionItem.reason.toString()}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(
                                        color: Colors.red,
                                      )),
                            )
                          ],

                          /// panding status end
                          SizedBox(
                            height: 8,
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              kTransformtionTxt.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(
                                    color: kLightAccent,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(kAccountNumberTxt.tr,
                                        style: TextStyle(color: kDarkAccent)),
                                    Text(
                                        transactionItem.bankAccountNumber
                                            .toString(),
                                        style: TextStyle(color: kOrangeColor)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Wrap(
                                      children: [
                                        Text(kMoneyAmountTxt.tr,
                                            style:
                                                TextStyle(color: kDarkAccent)),
                                        Text(
                                            transactionItem.moneyAmount
                                                .toString(),
                                            style:
                                                TextStyle(color: kOrangeColor)),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(kScreenShotTxt.tr,
                                        style: TextStyle(color: kDarkAccent))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Expanded(
                            flex: 3,
                            child: FluxImage(
                              imageUrl: transactionItem.confirmationImage == ""
                                  ? kEmptyImg
                                  : transactionItem.confirmationImage!,
                              fit: BoxFit.fill,
                              width: 100,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                /// make cancel button
                                Expanded(
                                  child: OvalButtonWdgt(
                                      text: kBackTxt.tr,
                                      onPressed: () {
                                        Get.back();
                                      }),
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
        ),
      );
    });
  }
}
