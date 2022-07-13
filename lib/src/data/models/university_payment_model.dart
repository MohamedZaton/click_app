import 'dart:convert';

import 'package:dio/dio.dart';

UniversityPaymentModel universityPaymentModelFromJson(String str) =>
    UniversityPaymentModel.fromJson(json.decode(str));
String universityPaymentModelToJson(UniversityPaymentModel data) =>
    json.encode(data.toJson());

class UniversityPaymentModel {
  String? moneyAmount;
  String? bankAccountName;
  String? bankAccountNumber;
  MultipartFile? confirmationImage;
  MultipartFile? passportImage;
  MultipartFile? idImage;
  UniversityPaymentModel({
    this.moneyAmount,
    this.bankAccountName,
    this.bankAccountNumber,
    this.confirmationImage,
    this.passportImage,
    this.idImage,
  });

  UniversityPaymentModel.fromJson(dynamic json) {
    moneyAmount = json['money_amount'];
    bankAccountName = json['bank_account_name'];
    bankAccountNumber = json['bank_account_number'];
    confirmationImage = json['confirmation_image'];
    passportImage = json['passport_image'];
    idImage = json['id_image'];
  }

  UniversityPaymentModel copyWith({
    String? moneyAmount,
    String? bankAccountName,
    String? bankAccountNumber,
    MultipartFile? confirmationImage,
    MultipartFile? passportImage,
    MultipartFile? idImage,
  }) =>
      UniversityPaymentModel(
        moneyAmount: moneyAmount ?? this.moneyAmount,
        bankAccountName: bankAccountName ?? this.bankAccountName,
        bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
        confirmationImage: confirmationImage ?? this.confirmationImage,
        passportImage: passportImage ?? this.passportImage,
        idImage: idImage ?? this.idImage,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['money_amount'] = moneyAmount;
    map['bank_account_name'] = bankAccountName;
    map['bank_account_number'] = bankAccountNumber;
    map['confirmation_image'] = confirmationImage;
    map['passport_image'] = passportImage;
    map['id_image'] = idImage;
    return map;
  }
}
