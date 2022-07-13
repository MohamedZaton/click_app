import 'package:get/get.dart';

import '../../../core/utils/constants.dart';

class LanguageListController extends GetxController {
  String selectedLang = kEnglishCode;

  void chooseLanguage(String languageCode) {
    selectedLang = languageCode;
    update();
  }

  String getLanguage() {
    return kEnglishCode;
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
