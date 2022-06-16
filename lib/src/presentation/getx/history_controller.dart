import 'package:click_app/src/data/models/transform_model.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  RxInt tabIndex = 0.obs;

  RxList<TransformModel> successList = <TransformModel>[].obs;
  RxList<TransformModel> pendingList = <TransformModel>[].obs;

  @override
  onInit() {
    super.onInit();
    fetchMapDataLists();
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

  void selectTab(int index) {
    tabIndex.value = index;
    update();
  }

  void fetchMapDataLists() {
    List<TransformModel> successDataList = [
      TransformModel(
          moneyAmount: '2000 doller',
          accountNumber: '123412341241',
          id: 654987,
          screenShotPath: ''),
      TransformModel(
          moneyAmount: '2000 doller',
          accountNumber: '123412341241',
          id: 654987,
          screenShotPath: ''),
    ];
    List<TransformModel> pendingDataList = [
      TransformModel(
          moneyAmount: '1000 doller',
          accountNumber: '123412341241',
          id: 654987,
          screenShotPath: ''),
      TransformModel(
          moneyAmount: '1000 doller',
          accountNumber: '123412341241',
          id: 654987,
          screenShotPath: ''),
    ];
    successList.value = successDataList;
    pendingList.value = pendingDataList;
  }
}
