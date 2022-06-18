import 'package:click_app/src/data/models/currency_model.dart';
import 'package:get/get.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/images_path.dart';

class CurrencyExchangeController extends GetxController {
  CurrencyModel selectedCurrency = CurrencyModel(
    name: "EGP",
    country: kEgyptText,
    value: "20",
    flagImg: kEgyptFlagImg,
  );
  CurrencyModel russiaCurrency = CurrencyModel(
    name: "RUBLE",
    country: kRussiaText,
    value: "20",
    flagImg: kRussiaFlagImg,
  );
  void chooseSelected(CurrencyModel selected) {
    selectedCurrency = selected;
    update();
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
