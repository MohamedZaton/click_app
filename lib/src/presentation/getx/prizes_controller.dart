import 'package:get/get.dart';

import '../../data/models/all_models.dart';
import '../../data/repositories/StudentRepositoryImpl.dart';

class PrizesController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<ServiceModel> servicesList = <ServiceModel>[].obs;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
    getServicesList();
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
