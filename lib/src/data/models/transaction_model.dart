import 'dart:convert';

import 'package:dio/dio.dart';

TransactionModel transactionModelFromJson(String str) =>
    TransactionModel.fromJson(json.decode(str));
String transactionModelToJson(TransactionModel data) =>
    json.encode(data.toJson());

class TransactionModel {
  TransactionModel({
    this.moneyAmount,
    this.bankAccountName,
    this.bankAccountNumber,
    this.confirmationImage,
  });

  TransactionModel.fromJson(dynamic json) {
    moneyAmount = json['money_amount'];
    bankAccountName = json['bank_account_name'];
    bankAccountNumber = json['bank_account_number'];
    confirmationImage = json['confirmation_image'];
  }
  String? moneyAmount;
  String? bankAccountName;
  String? bankAccountNumber;
  MultipartFile? confirmationImage;
  TransactionModel copyWith({
    String? moneyAmount,
    String? bankAccountName,
    String? bankAccountNumber,
    MultipartFile? confirmationImage,
  }) =>
      TransactionModel(
        moneyAmount: moneyAmount ?? this.moneyAmount,
        bankAccountName: bankAccountName ?? this.bankAccountName,
        bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
        confirmationImage: confirmationImage ?? this.confirmationImage,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['money_amount'] = moneyAmount;
    map['bank_account_name'] = bankAccountName;
    map['bank_account_number'] = bankAccountNumber;
    map['confirmation_image'] = confirmationImage;
    return map;
  }
}
