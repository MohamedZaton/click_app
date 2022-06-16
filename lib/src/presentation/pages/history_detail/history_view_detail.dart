import 'package:click_app/src/core/utils/constants.dart';
import 'package:click_app/src/core/utils/images_path.dart';
import 'package:click_app/src/presentation/getx/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/screens.dart';
import '../../widgets/flux_image.dart';
import '../../widgets/oval_btn_widget.dart';

class HistoryDetailPage extends StatelessWidget {
  final controller = Get.put(HistoryController());

  static const String id = "/historyDetailPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kSuccessTxt),
        centerTitle: true,
      ),
      body: Container(
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
                    Container(
                      height: ScreenWeb.heigth(context) * 0.12,
                      color: kLightAccent,
                    ),
                    Positioned(
                      top: ScreenWeb.heigth(context) * 0.08,
                      left: ScreenWeb.width(context) * 0.07,
                      right: ScreenWeb.width(context) * 0.07,
                      bottom: ScreenWeb.heigth(context) * 0.008,
                      child: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: FluxImage(
                            imageUrl: kSuccessImg,
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
                padding: EdgeInsets.symmetric(horizontal: spacing_standard_new),
                child: Container(
                  height: ScreenWeb.heigth(context) * 0.50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          kCurrencyExchangeTxt,
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
                          kDoneTransformTxt,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: kDarkGray),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          kTransformtionTxt,
                          style:
                              Theme.of(context).textTheme.subtitle2?.copyWith(
                                    color: kLightAccent,
                                    decoration: TextDecoration.underline,
                                  ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(kAccountNumberTxt,
                                    style: TextStyle(color: kDarkAccent)),
                                Text("123131",
                                    style: TextStyle(color: kOrangeColor)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(kMoneyAmountTxt,
                                    style: TextStyle(color: kDarkAccent)),
                                Text("123131",
                                    style: TextStyle(color: kOrangeColor)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(kScreenShotTxt,
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
                        flex: 2,
                        child: FluxImage(
                          imageUrl: kScreenShotImg,
                          fit: BoxFit.cover,
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
                                  text: kCancelTxt,
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
    );
  }
}
