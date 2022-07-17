import 'package:click_app/src/presentation/pages/language_list/language_list_controller.dart';
import 'package:get/get.dart';

import '../../core/utils/constants.dart';
import '../../data/models/all_models.dart';
import '../../data/repositories/StudentRepositoryImpl.dart';

class PrizesController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<ServiceModel> servicesList = <ServiceModel>[].obs;
  final languageLogic = Get.find<LanguageListController>();
  RxString language = kEnglishCode.obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() async {
    super.onInit();
    getServicesList();
    language.value = await languageLogic.getLanguage();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<void> getServicesList() async {
    isLoading.value = true;
    final response = await StudentRepositoryImpl().getServicesList();
    response.fold((l) {
      isLoading.value = false;

      print("[getServicesList] error: " + l.message);
      return;
    }, (fetchlist) {
      isLoading.value = false;

      servicesList.value = fetchlist;
    });
  }
}
