import 'package:click_app/src/data/repositories/StudentRepositoryImpl.dart';
import 'package:get/get.dart';

import '../../services/server_app_api.dart';
import '../pages/splash/splash_view.dart';

class SettingController extends GetxController {
  List<String> numbersWatsappList = [];
  String aboutText = "تطبيق Click ";
  @override
  void onInit() {
    super.onInit();
    getWhatsAppNumbers();
    getAboutParagraph();
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

  void getAboutParagraph() async {
    final responce = await ServerAppApi().getAboutsRequest();

    print("getAboutParagraph  :${responce.data.toString()}");
    aboutText = responce.data.toString();
    update();
  }

  void logOutProcess() async {
    Get.off(() => SplashPage());

    await StudentRepositoryImpl().getLogOut();
  }
}
