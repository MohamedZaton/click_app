import 'package:click_app/src/services/local_data.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants.dart';

class LanguageListController extends GetxController {
  String selectedLang = kEnglishCode;

  void chooseLanguage(String languageCode) {
    LocalData().writeLanguage(languageCode);
    selectedLang = languageCode;
    update();
  }

  Future<String> getLanguage() async {
    selectedLang = await LocalData().readLanguage() ?? kEnglishCode;
    update();
    return selectedLang;
  }

  @override
  void onInit() {
    super.onInit();
    getLanguage();
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
