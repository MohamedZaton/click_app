import 'package:click_app/src/core/utils/colors.dart';
import 'package:click_app/src/core/utils/images_path.dart';
import 'package:click_app/src/presentation/widgets/flux_image.dart';
import 'package:flutter/material.dart';

class ItemHistoryWidget extends StatelessWidget {
  final int creditCode;
  final double money;
  final Function() onPress;
  const ItemHistoryWidget(
      {Key? key,
      this.creditCode = 11111111111,
      this.money = 2222,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: MaterialButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FluxImage(
              imageUrl: kCreditImg,
              width: 20,
              height: 20,
            ),
            Text(creditCode.toString()),
            FluxImage(
              imageUrl: kWalledImg,
              width: 20,
              height: 20,
            ),
            Text(money.toString()),
          ],
        ),
        textColor: kDarkAccent,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(25.0)),
        color: kPrizeCardBkgdColor,
        onPressed: onPress,
      ),
    );
  }
}
