import 'package:click_app/src/data/models/all_models.dart';
import 'package:click_app/src/data/models/currency_model.dart';
import 'package:click_app/src/data/repositories/StudentRepositoryImpl.dart';
import 'package:get/get.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/images_path.dart';

class CurrencyExchangeController extends GetxController {
  RxList<AdsModel> adsList = <AdsModel>[].obs;
  RxList<DataCurrenciesModel> currencyList = <DataCurrenciesModel>[].obs;
  RxDouble inputMoney = 0.0.obs;
  RxString outputMoneyRussia = "".obs;
  Rx<DataCurrenciesModel> selectedCountryCurrency = DataCurrenciesModel().obs;

  CurrencyModel selectedCurrency = CurrencyModel(
    name: "EGP",
    country: kEgyptTxt.tr,
    value: "20",
    flagImg: kEgyptFlagImg,
  );
  CurrencyModel russiaCurrency = CurrencyModel(
    name: "RUBLE",
    country: kRussiaTxt.tr,
    value: "20",
    flagImg: kRussiaFlagImg,
  );
  void selectCountryCurrency(DataCurrenciesModel selected) {
    selectedCountryCurrency.value = selected;
  }

  @override
  void onInit() {
    super.onInit();
    getAds();
    getCurrencyList();
  }

  @override
  void onReady() {
    super.onReady();
    getAds();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getAds() async {
    final response = await StudentRepositoryImpl().getAdsList();
    response.fold((l) {
      print("[getAds] error: " + l.message);
      return;
    }, (fetchlist) {
      adsList.value = fetchlist;
      return adsList.value;
    });
    update();
  }

  void getCurrencyList() async {
    final response = await StudentRepositoryImpl().getCurrencyList();
    response.fold((l) {
      print("[getCurrencyList] error: " + l.message);
      return;
    }, (dataCurrencylist) {
      currencyList.value = dataCurrencylist;
      selectedCountryCurrency.value = currencyList.value[0];
      return currencyList.value;
    });
  }

  Future<void> checkConvertfromMoneyToRussia(
      {required int countryCode, required double inputMoney}) async {
    final response =
        await StudentRepositoryImpl().getCheckRate(countryCode, inputMoney);
    response.fold((l) {
      print("[getCurrencyList] error: " + l.message);
      return;
    }, (rubEqual) {
      outputMoneyRussia.value = rubEqual;
      return;
    });
  }
}
