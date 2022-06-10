import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx/currency_exchange_controller.dart';

class CurrencyExchangePage extends StatelessWidget {
  final logic = Get.put(CurrencyExchangeController());

  static const String id = "/currencyExchange";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("exchanger tab"),
        ],
      ),
    );
  }
}
