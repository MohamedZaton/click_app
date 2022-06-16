import 'package:click_app/src/core/utils/colors.dart';
import 'package:click_app/src/core/utils/screens.dart';
import 'package:click_app/src/presentation/widgets/flux_image.dart';
import 'package:flutter/material.dart';

import '../../core/utils/images_path.dart';
import '../../core/utils/styles.dart';

class UploadingButtonWdgt extends StatelessWidget {
  final String nameBtn;
  UploadingButtonWdgt({Key? key, required this.nameBtn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: decorEggsBlueBoarder,
        width: ScreenWeb.width(context) * 0.95,
        height: ScreenWeb.width(context) * 0.30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FluxImage(imageUrl: kUploadingImg),
            SizedBox(
              height: 10,
            ),
            FittedBox(
                child: Text(
              nameBtn,
              style:
                  TextStyle(color: kLightAccent, fontWeight: FontWeight.bold),
            ))
          ],
        ),
      ),
    );
  }
}
