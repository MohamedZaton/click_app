import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx/splash_controller.dart';
import '../../widgets/flux_image.dart';
import '../sign_in/sign_in_view.dart';

class SplashPage extends StatelessWidget {
  static const String id = "/splash";

  final logic = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    double? targetValue = 80;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: targetValue),
          duration: const Duration(seconds: 3),
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
            Get.offAll(() => SignInPage());
          },
        ),
      ),
    );
  }
}
