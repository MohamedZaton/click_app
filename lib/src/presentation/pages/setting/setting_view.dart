import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx/setting_controller.dart';

class SettingPage extends StatelessWidget {
  final logic = Get.put(SettingController());
  static const String id = "/settings";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("settings tab"),
        ],
      ),
    );
  }
}
