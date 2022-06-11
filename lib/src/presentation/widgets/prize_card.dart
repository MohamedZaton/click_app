import 'package:click_app/src/core/utils/colors.dart';
import 'package:click_app/src/core/utils/screens.dart';
import 'package:click_app/src/presentation/widgets/flux_image.dart';
import 'package:flutter/material.dart';

class PrizeCard extends StatelessWidget {
  final String? logoPath;
  final String title;
  final String body;
  const PrizeCard(
      {Key? key,
      required this.logoPath,
      required this.title,
      required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        PrizeBody(
          title: title,
          body: body,
        ),
        PrizeLogo(
          logoPath: logoPath,
        ),
      ],
    );
  }
}

class PrizeLogo extends StatelessWidget {
  final String? logoPath;

  const PrizeLogo({
    Key? key,
    this.logoPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      alignment: FractionalOffset.center,
      height: 70,
      width: 70,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: FluxImage(
          imageUrl: logoPath.toString(),
          width: 70,
          height: 70,
        ),
        radius: 50,
      ),
    );
  }
}

class PrizeBody extends StatelessWidget {
  final String? title;
  final String? body;
  const PrizeBody({
    Key? key,
    this.title,
    this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(top: 30),
        height: ScreenWeb.heigth(context) * 0.55,
        width: ScreenWeb.width(context) * 0.8,
        decoration: BoxDecoration(
          color: kPrizeCardBkgdColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          padding: EdgeInsets.only(left: 8, right: 8, top: 45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                runSpacing: 5,
                children: [
                  Text(
                    title.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: kDarkAccent),
                  ),
                  Text(
                    body.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
