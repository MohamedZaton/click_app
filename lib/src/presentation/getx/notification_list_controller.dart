import 'package:click_app/src/services/local_data.dart';
import 'package:get/get.dart';

import '../../data/models/all_models.dart';
import '../../data/repositories/StudentRepositoryImpl.dart';

class NotificationListController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<NotificationModel> notificationList = <NotificationModel>[].obs;
  RxInt numNotification = 0.obs;
  RxBool isNewNotification = false.obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
    getNotificationList();
    notificationStatue();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<void> notificationStatue() async {
    numNotification.value = await LocalData().readNewNotificationLenght();
    isNewNotification.value = await LocalData().readNewNotification();
  }

  Future<void> getNotificationList() async {
    isLoading.value = true;
    final response = await StudentRepositoryImpl().getNotificationList();
    response.fold((l) {
      isLoading.value = false;

      print("[getNotificationList] error: " + l.message);
      return;
    }, (fetchlist) async {
      isLoading.value = false;

      notificationList.value = fetchlist;
      int oldLenght = await LocalData().readNewNotificationLenght();
      int numNewNotifi = notificationList.value.length - oldLenght;
      if (numNewNotifi > 0) {
        await LocalData().writeNotificationLength(numNewNotifi);

        await LocalData().writeNewNotification(true);
      }
      numNotification.value = await LocalData().readNewNotificationLenght();
      isNewNotification.value = await LocalData().readNewNotification();
    });
  }
}
