import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/utils/constants.dart';

class LanguageListController extends GetxController {
  String selectedLang = kEnglishCode;
  final box = GetStorage();

  void chooseLanguage(String languageCode) {
    box.write(kLanguageTxt, languageCode);
    selectedLang = languageCode;
    update();
  }

  String getLanguage() {
    return box.read(kLanguageTxt) ?? kEnglishCode;
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
