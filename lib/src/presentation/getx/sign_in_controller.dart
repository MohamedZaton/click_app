import 'package:click_app/src/core/utils/constants.dart';
import 'package:click_app/src/data/repositories/StudentRepositoryImpl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/all_models.dart';
import '../pages/home/home_view.dart';

class SignInController extends GetxController {
  bool isLoading = false;
  bool isHiddenPassword = true;

  void loadingWaitingSignIn(bool loading) {
    isLoading = loading;
    update();
  }

  void setPasswordHidden(bool isHidden) {
    isHiddenPassword = isHidden;
    update();
  }

  void loginUser(LogInModel logInModel) async {
    isLoading = true;
    final responce = await StudentRepositoryImpl().postLogin(logInModel);
    responce.fold((f) {
      //error
      Get.snackbar(kSignInTxt, f.message, backgroundColor: Colors.red);
      isLoading = false;

      return;
    }, (r) {
      //success
      Get.snackbar(kSignInTxt, kSignUpSuccessText,
          backgroundColor: Colors.green);
      isLoading = false;
      return Get.offAll(() => HomePage());
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
