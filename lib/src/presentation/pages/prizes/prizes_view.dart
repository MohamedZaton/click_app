import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx/prizes_controller.dart';

class PrizesPage extends StatelessWidget {
  final logic = Get.put(PrizesController());

  static const String id = "/prizes";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("prizes tab"),
        ],
      ),
    );
  }
}
