import 'package:click_app/src/core/utils/images_path.dart';
import 'package:click_app/src/data/repositories/StudentRepositoryImpl.dart';
import 'package:get/get.dart';

import '../../core/utils/constants.dart';
import '../../data/models/all_models.dart';

enum Status { PENDING, REJECTED, COMPLETED }

class HistoryController extends GetxController {
  RxInt tabIndex = 0.obs;
  RxBool isTimerFinishedPadding = false.obs;
  RxList<TransactionsListModel> successList = <TransactionsListModel>[].obs;
  RxList<TransactionsListModel> pendingList = <TransactionsListModel>[].obs;
  RxList<TransactionsListModel> rejectedList = <TransactionsListModel>[].obs;
  // RxList<bool> selectedToggelButton = [true, false, false].obs;
  RxMap<String, String> selectStatueTitleImageMap = {
    kSuccessTxt: kSuccessImg,
    kPendingTxt: kPendingImg,
    kRejectedTxt: kRejectedImg
  }.obs;

  RxString selectedStatueItem = kSuccessTxt.obs;
  Rx<TransactionsListModel> historyItem =
      TransactionsListModel(id: 666, moneyAmount: 100).obs;

  @override
  onInit() {
    super.onInit();
    fetchTransactionsList();
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

  void changeClickItem(String statusType, TransactionsListModel selectedItem) {
    selectedStatueItem.value = statusType;
    historyItem.value = selectedItem;
  }

  void fetchTransactionsList() {
    getTransactionRequest(
        status: Status.PENDING.name, typeContainerList: successList.value);
    getTransactionRequest(
        status: Status.REJECTED.name, typeContainerList: pendingList.value);
    getTransactionRequest(
        status: Status.COMPLETED.name, typeContainerList: rejectedList.value);
  }

  Future<void> getTransactionRequest(
      {required String status,
      required List<TransactionsListModel> typeContainerList}) async {
    final response = await StudentRepositoryImpl().getTransactionsList(status);
    response.fold((failure) {
      print("[getTransactionRequest ] error : ${failure.message}");
      return;
    }, (transactionsListModel) {
      typeContainerList = transactionsListModel;
      return;
    });
  }
}
