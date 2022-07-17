import 'package:click_app/src/core/utils/constants.dart';
import 'package:click_app/src/core/utils/images_path.dart';
import 'package:click_app/src/data/models/all_models.dart';
import 'package:click_app/src/presentation/getx/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/screens.dart';
import '../../../core/utils/time_helper.dart';
import '../../widgets/count_down_timer.dart';
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
      SingleTransactionModel transactionItem =
          controller.singleTransactionItem.value;

      int expireHours = 2;
      controller.isTimerFinishedPadding.value = TimeHelper()
          .isTransactionExpired(
              createTime: transactionItem.createdAt!, exprieHour: expireHours);

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
                          if (transactionItem.status == Status.PENDING.name &&
                              controller.isTimerFinishedPadding.value ==
                                  true) ...[
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
                                  CounterDownTimerWgt(
                                    minutes:
                                        Duration(hours: expireHours).inMinutes,
                                    onEnd: () {
                                      controller.isTimerFinishedPadding.value =
                                          true;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                          if (controller.isTimerFinishedPadding.value) ...[
                            Expanded(
                                flex: 1,
                                child: FittedBox(
                                    child: Text(kContactUsDetailsTxt))),
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: ScreenDevices.width(context) * 0.7,
                                    height: ScreenDevices.heigth(context) * 0.1,
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
                                                controller
                                                    .numbersWatsappList.value);
                                          } else {
                                            Get.snackbar(
                                                kContactUsTxt.tr, "Not found");
                                          }
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
