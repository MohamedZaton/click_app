import 'package:click_app/src/core/utils/images_path.dart';
import 'package:click_app/src/data/models/transform_model.dart';
import 'package:get/get.dart';

import '../../core/utils/constants.dart';

class HistoryController extends GetxController {
  RxInt tabIndex = 0.obs;

  RxList<TransformModel> successList = <TransformModel>[].obs;
  RxList<TransformModel> pendingList = <TransformModel>[].obs;
  RxList<TransformModel> rejectedList = <TransformModel>[].obs;
  // RxList<bool> selectedToggelButton = [true, false, false].obs;
  RxMap<String, String> selectStatueTitleImageMap = {
    kSuccessTxt: kSuccessImg,
    kPendingTxt: kPendingImg,
    kRejectedTxt: kRejectedImg
  }.obs;

  RxString selectedStatueItem = kSuccessTxt.obs;
  Rx<TransformModel> historyItem = TransformModel(
          moneyAmount: '2000 doller',
          accountNumber: '123412341241',
          id: 654987,
          screenShotPath: '')
      .obs;

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
/*    selectedToggelButton.value = [false, false, false];
    selectedToggelButton.value[index] = true;*/
    tabIndex.value = index;
  }

  void changeClickItem(String statusType, TransformModel selectedItem) {
    selectedStatueItem.value = statusType;
    historyItem.value = selectedItem;
  }

  void fetchMapDataLists() {
    List<TransformModel> successDataList = [
      TransformModel(
          moneyAmount: '2000 doller',
          accountNumber: '654987',
          id: 654907,
          screenShotPath: ''),
      TransformModel(
          moneyAmount: '2000 doller',
          accountNumber: '654987',
          id: 654983,
          screenShotPath: ''),
    ];
    List<TransformModel> pendingDataList = [
      TransformModel(
          moneyAmount: '1000 doller',
          accountNumber: '654987',
          id: 654977,
          screenShotPath: ''),
      TransformModel(
          moneyAmount: '1000 doller',
          accountNumber: '654987',
          id: 654947,
          screenShotPath: ''),
    ];
    List<TransformModel> rejectedDataList = [
      TransformModel(
          moneyAmount: '1010 doller',
          accountNumber: '600987',
          id: 600987,
          screenShotPath: ''),
      TransformModel(
          moneyAmount: '1010 doller',
          accountNumber: '600987',
          id: 600987,
          screenShotPath: ''),
    ];
    successList.value = successDataList;
    pendingList.value = pendingDataList;
    rejectedList.value = rejectedDataList;
  }
}
