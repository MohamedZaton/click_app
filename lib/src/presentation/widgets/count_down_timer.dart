import 'package:click_app/src/core/utils/time_helper.dart';
import 'package:flutter/material.dart';

class CounterDownTimerWgt extends StatelessWidget {
  final int minutes;
  final Function() onEnd;
  CounterDownTimerWgt({Key? key, required this.minutes, required this.onEnd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 60,
      child: TweenAnimationBuilder<Duration>(
          duration: Duration(minutes: minutes),
          tween: Tween(begin: Duration(minutes: minutes), end: Duration.zero),
          onEnd: onEnd,
          builder: (BuildContext context, Duration value, Widget? child) {
            final minutes = value.inMinutes;
            final seconds = value.inSeconds % 60;
            return Text(TimeHelper().intToTimeLeft(minutes),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20));
          }),
    );
  }
}
