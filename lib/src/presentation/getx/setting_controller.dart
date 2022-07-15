import 'package:click_app/src/data/repositories/StudentRepositoryImpl.dart';
import 'package:get/get.dart';

import '../pages/splash/splash_view.dart';

class SettingController extends GetxController {
  List<String> numbersWatsappList = [];

  @override
  void onInit() {
    super.onInit();
    getwhatsappNumbers();
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

  void getwhatsappNumbers() async {
    final response = await StudentRepositoryImpl().getWhatsAppNumbers();
    response.fold((failure) {
      print("[getwhatsappNumbers] error : ${failure.message}");
      update();
      return;
    }, (whatsAppNumbers) {
      numbersWatsappList = whatsAppNumbers;
      update();
      return;
    });
  }

  void logOutProcess() async {
    final responce = await StudentRepositoryImpl().getLogOut();
    responce.fold(
      (l) => Get.to(() => SplashPage()),
      (r) => Get.to(() => SplashPage()),
    );
  }
}
