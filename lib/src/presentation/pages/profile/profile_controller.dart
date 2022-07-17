import 'dart:io';

import 'package:click_app/src/core/utils/constants.dart';
import 'package:click_app/src/data/models/all_models.dart';
import 'package:click_app/src/data/repositories/StudentRepositoryImpl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/styles.dart';
import '../../widgets/oval_btn_widget.dart';

class ProfileController extends GetxController {
  RxBool isLoading = false.obs;

  Rx<DataProfile> dataProfileModel = DataProfile().obs;

  Rx<File> imageProfile = File('').obs;
  RxString imageProfilePath = "".obs;
  final ImagePicker _picker = ImagePicker();
  RxBool isAttachedProfile = false.obs;
  void loadingProfile(bool loading) {
    isLoading.value = loading;
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

  @override
  void onInit() async {
    super.onInit();
    await getProfileInfo();
  }

  Future<File> getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageProfile.value = File(pickedFile.path);
      imageProfilePath.value = pickedFile.path;

      isAttachedProfile.value = true;
    } else {
      print('No image selected.');
    }
    return imageProfile.value;
  }

  Future<void> putProfileInfo() async {
    loadingProfile(true);
    final response = await StudentRepositoryImpl().putProfileInfo(
        RegisterModel(
          name: dataProfileModel.value.name!,
          email: dataProfileModel.value.email!,
          phone: dataProfileModel.value.phone!,
        ),
        imageProfile.value);
    response.fold((l) {
      Get.snackbar(kProfileTxt, "Failed getInfo", backgroundColor: Colors.red);
      loadingProfile(false);

      return;
    }, (isSucess) {
      if (isSucess) {
        Get.snackbar(kProfileTxt, "Update profile Success",
            backgroundColor: Colors.green);
      } else {
        Get.snackbar(kProfileTxt, " Update profile Failed",
            backgroundColor: Colors.red);
      }

      loadingProfile(false);
      return;
    });
  }

  Future<void> getProfileInfo() async {
    loadingProfile(true);
    final response = await StudentRepositoryImpl().getProfileInfo();
    response.fold((l) {
      Get.snackbar(kProfileTxt, "Failed getInfo", backgroundColor: Colors.red);
      loadingProfile(false);

      return;
    }, (dataProfile) {
      dataProfileModel.value = dataProfile;
      loadingProfile(false);
      return null;
    });
  }

  Future<dynamic> updateNameDg({
    required String title,
    required String titleField,
    required Function(String)? onChangedV,
  }) {
    return Get.defaultDialog(
      title: title,
      titleStyle: TextStyle(color: kLightAccent),
      middleTextStyle: TextStyle(color: Colors.black),
      backgroundColor: Colors.white,
      content: Container(
        height: 200,
        width: 300,
        child: Container(
          child: Column(
            children: [
              TextField(
                decoration: editTextWithBoarderDecoration(titleField),
                cursorColor: kLightAccent,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onChanged: onChangedV,
              ),
              SizedBox(
                height: 30,
              ),
              OvalButtonWdgt(
                  text: kDoneTxt.tr.toUpperCase(),
                  textColor: Colors.white,
                  isCenter: true,
                  onPressed: () {
                    Get.back();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
