import 'dart:io';

import 'package:click_app/src/core/utils/colors.dart';
import 'package:click_app/src/core/utils/screens.dart';
import 'package:click_app/src/presentation/widgets/flux_image.dart';
import 'package:flutter/material.dart';

import '../../core/utils/images_path.dart';
import '../../core/utils/styles.dart';

class UploadingImgButtonWdgt extends StatelessWidget {
  final String nameBtn;
  final bool? isAttachedImage;
  final Function() onPress;
  final File? imageFile;

  UploadingImgButtonWdgt({
    Key? key,
    required this.nameBtn,
    this.isAttachedImage = false,
    required this.onPress,
    this.imageFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: ClipRRect(
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: decorEggsBlueBoarder,
          width: ScreenDevices.width(context) * 0.95,
          height: ScreenDevices.width(context) * 0.30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isAttachedImage == false) ...[
                FluxImage(imageUrl: kUploadingImg),
              ] else ...[
                Image.file(
                  imageFile!,
                  scale: 5,
                  fit: BoxFit.contain,
                )
              ],
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
      ),
    );
  }
}
