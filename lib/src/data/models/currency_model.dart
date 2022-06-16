import 'package:click_app/src/domain/entities/currency.dart';

class CurrencyModel extends Currency {
  CurrencyModel({
    required super.name,
    required super.country,
    required super.value,
    required super.flagImg,
  });
}
