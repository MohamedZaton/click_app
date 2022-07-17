import 'dart:io';

import 'package:click_app/src/data/repositories/StudentRepositoryImpl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/utils/constants.dart';
import '../../data/models/all_models.dart';
import '../pages/home/home_view.dart';

class SignUpController extends GetxController {
  bool isLoading = false;
  File image = new File('');
  String? imagePath = kAvatarImage;
  final ImagePicker _picker = ImagePicker();
  bool isAttached = false;
  bool isHiddenPassword = true;

  void setPasswordHidden(bool isHidden) {
    isHiddenPassword = isHidden;
    update();
  }

  void loadingWaitingRegister(bool loading) {
    isLoading = loading;
    update();
  }

  Future<File> getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      imagePath = pickedFile.path;
      print(imagePath);
      isAttached = true;

      update();
    } else {
      print('No image selected.');
    }
    return image;
  }

  Future<void> registerNewStudent(
      RegisterModel registerModel, File image) async {
    isLoading = true;
    final responce =
        await StudentRepositoryImpl().postRegister(registerModel, image);
    responce.fold((failure) {
      //error
      print("[RegisterNewStudent] error : ${failure.message}");
      Get.snackbar(kSignUpTxt, kSignUpFailedText, backgroundColor: Colors.red);
      isLoading = false;
      // Get.offAll(() => HomePage());
      return;
    }, (r) {
      //success
      Get.snackbar(kSignUpTxt, kSignUpSuccessText,
          backgroundColor: Colors.green);

      isLoading = false;
      Get.offAll(() => HomePage());
      return;
    });
    update();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
