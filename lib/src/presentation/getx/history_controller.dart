import 'package:click_app/src/core/utils/images_path.dart';
import 'package:click_app/src/data/repositories/StudentRepositoryImpl.dart';
import 'package:get/get.dart';

import '../../data/models/all_models.dart';
import '../pages/history_detail/history_view_detail.dart';

enum Status { PENDING, REJECTED, COMPLETED }

class HistoryController extends GetxController {
  RxBool isLoadingDetails = false.obs;
  RxInt tabIndex = 0.obs;
  RxBool isTimerFinishedPadding = false.obs;
  RxList<TransactionsListModel> successList = <TransactionsListModel>[].obs;
  RxList<TransactionsListModel> pendingList = <TransactionsListModel>[].obs;
  RxList<TransactionsListModel> rejectedList = <TransactionsListModel>[].obs;
  RxList<String> numbersWatsappList = <String>[].obs;

  Rx<SingleTransactionModel> singleTransactionItem =
      SingleTransactionModel().obs;

  // RxList<bool> selectedToggelButton = [true, false, false].obs;
  RxMap<String, String> selectStatueTitleImageMap = {
    Status.COMPLETED.name: kSuccessImg,
    Status.PENDING.name: kPendingImg,
    Status.REJECTED.name: kRejectedImg
  }.obs;

  Rx<TransactionsListModel> historyItem =
      TransactionsListModel(id: 666, moneyAmount: "100").obs;

  @override
  onInit() async {
    super.onInit();
    await fetchTransactionsList();
    await getWhatsAppNumbers();
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

  Future<void> getWhatsAppNumbers() async {
    final response = await StudentRepositoryImpl().getWhatsAppNumbers();
    response.fold((failure) {
      print("[getWhatsAppNumbers] error : ${failure.message}");
      update();
      return;
    }, (whatsAppNumbers) {
      numbersWatsappList.value = whatsAppNumbers;
      update();
      return;
    });
  }

  void selectTab(int index) {
/*    selectedToggelButton.value = [false, false, false];
    selectedToggelButton.value[index] = true;*/
    tabIndex.value = index;
  }

  Future<void> getSingleTransactionClick(int id) async {
    isLoadingDetails.value = true;
    final response =
        await StudentRepositoryImpl().getSingleTransactionRequest(id);
    response.fold((failure) {
      Get.snackbar("transaction Detail", "Problem ${failure.message}");
      isLoadingDetails.value = false;

      return;
    }, (dataTransaction) {
      singleTransactionItem.value = dataTransaction;
      Get.to(() => HistoryDetailPage());
      isLoadingDetails.value = false;

      return;
    });
  }

  Future<void> fetchTransactionsList() async {
    await getTransactionListRequest(
        status: Status.COMPLETED.name, typeContainerList: Status.COMPLETED);
    await getTransactionListRequest(
        status: Status.PENDING.name, typeContainerList: Status.PENDING);
    await getTransactionListRequest(
        status: Status.REJECTED.name, typeContainerList: Status.REJECTED);
  }

  Future<void> getTransactionListRequest(
      {required String status, required Status typeContainerList}) async {
    final response = await StudentRepositoryImpl().getTransactionsList(status);
    response.fold((failure) {
      print("[getTransactionRequest ] error : ${failure.message}");
      return;
    }, (transactionsListModel) {
      if (typeContainerList == Status.COMPLETED)
        successList.value = transactionsListModel;
      if (typeContainerList == Status.PENDING)
        pendingList.value = transactionsListModel;
      if (typeContainerList == Status.REJECTED)
        rejectedList.value = transactionsListModel;

      return;
    });
  }
}
