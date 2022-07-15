import 'package:click_app/src/presentation/pages/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/local_data.dart';
import '../../getx/splash_controller.dart';
import '../../widgets/flux_image.dart';
import '../sign_in/sign_in_view.dart';

class SplashPage extends StatelessWidget {
  static const String id = "/splash";

  final logic = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    double? targetValue = 300;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: targetValue),
          duration: const Duration(seconds: 1),
          builder: (context, value, Widget? child) {
            return FluxImage(
              imageUrl: 'assets/logo/logo.png',
              width: value,
              height: value,
            );
          },
          child: FluxImage(
            imageUrl: 'assets/logo/logo.png',
            width: 80,
            height: 80,
          ),
          onEnd: () async {
            final bool isAuto = await LocalData().readAcceptAutoLogin();
            if (isAuto) {
              return Get.offAll(() => HomePage());
            } else {
              return Get.offAll(() => SignInPage());
            }
          },
        ),
      ),
    );
  }
}
