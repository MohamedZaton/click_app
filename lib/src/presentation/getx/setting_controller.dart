import 'package:click_app/src/data/repositories/StudentRepositoryImpl.dart';
import 'package:get/get.dart';

import '../pages/splash/splash_view.dart';

class SettingController extends GetxController {
  List<String> numbersWatsappList = [];

  @override
  void onInit() {
    super.onInit();
    getWhatsAppNumbers();
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

  void getWhatsAppNumbers() async {
    final response = await StudentRepositoryImpl().getWhatsAppNumbers();
    response.fold((failure) {
      print("[getWhatsAppNumbers] error : ${failure.message}");
      update();
      return;
    }, (whatsAppNumbers) {
      numbersWatsappList = whatsAppNumbers;
      update();
      return;
    });
  }

  void logOutProcess() async {
    Get.off(() => SplashPage());

    await StudentRepositoryImpl().getLogOut();
  }
}
