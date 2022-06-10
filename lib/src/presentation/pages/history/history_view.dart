import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx/history_controller.dart';

class HistoryPage extends StatelessWidget {
  final logic = Get.put(HistoryController());

  static const String id = "/history";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("history tab"),
        ],
      ),
    );
  }
}
