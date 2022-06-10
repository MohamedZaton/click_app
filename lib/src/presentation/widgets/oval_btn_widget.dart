import 'package:flutter/material.dart';

import '../../core/utils/colors.dart';

class OvalButtonWdgt extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final void Function() onPressed;

  OvalButtonWdgt(
      {Key? key,
      required this.text,
      this.textColor = Colors.white,
      this.backgroundColor = kLightAccent,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: MaterialButton(
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
        textColor: textColor,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(40.0)),
        color: backgroundColor,
        onPressed: onPressed,
      ),
    );
  }
}
