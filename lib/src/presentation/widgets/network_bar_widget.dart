import 'package:flutter/material.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/screens.dart';

class NetworkBarWidget extends StatelessWidget {
  const NetworkBarWidget({Key? key, this.isConnect = true}) : super(key: key);
  final bool isConnect;

  @override
  Widget build(BuildContext context) {
    return isConnect
        ? SizedBox(
            width: ScreenWeb.width(context),
            height: 1,
          )
        : Container(
            alignment: Alignment.center,
            color: Colors.red,
            height: 32,
            width: ScreenWeb.width(context),
            child: Center(
              child: Text(kOfflineTxt,
                  style: Theme.of(context).textTheme.headline6!),
            ),
          );
  }
}
