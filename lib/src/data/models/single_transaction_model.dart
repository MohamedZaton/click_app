import 'dart:convert';

SingleTransactionModel singleTransactionModelFromJson(String str) =>
    SingleTransactionModel.fromJson(json.decode(str));
String singleTransactionModelToJson(SingleTransactionModel data) =>
    json.encode(data.toJson());

class SingleTransactionModel {
  SingleTransactionModel({
    this.dataSingleTransactionModel,
  });

  SingleTransactionModel.fromJson(dynamic json) {
    dataSingleTransactionModel = json['data'] != null
        ? DataSingleTransactionModel.fromJson(json['data'])
        : null;
  }
  DataSingleTransactionModel? dataSingleTransactionModel;
  SingleTransactionModel copyWith({
    DataSingleTransactionModel? data,
  }) =>
      SingleTransactionModel(
        dataSingleTransactionModel: data ?? this.dataSingleTransactionModel,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (dataSingleTransactionModel != null) {
      map['data'] = dataSingleTransactionModel?.toJson();
    }
    return map;
  }
}

class DataSingleTransactionModel {
  int? id;
  String? moneyAmount;
  String? bankAccountName;
  String? bankAccountNumber;
  String? confirmationImage;
  String? status;
  String? reason;
  String? createdAt;
  DataSingleTransactionModel({
    this.id,
    this.moneyAmount,
    this.bankAccountName,
    this.bankAccountNumber,
    this.confirmationImage,
    this.status,
    this.reason,
    this.createdAt,
  });

  DataSingleTransactionModel.fromJson(dynamic json) {
    id = json['id'];
    moneyAmount = json['money_amount'];
    bankAccountName = json['bank_account_name'];
    bankAccountNumber = json['bank_account_number'];
    confirmationImage = json['confirmation_image'] ?? "";
    status = json['status'];
    reason = json['reason'] ?? "";
    createdAt = json['created_at'];
  }

  DataSingleTransactionModel copyWith({
    int? id,
    String? moneyAmount,
    String? bankAccountName,
    String? bankAccountNumber,
    String? confirmationImage,
    String? status,
    String? reason,
    String? createdAt,
  }) =>
      DataSingleTransactionModel(
        id: id ?? this.id,
        moneyAmount: moneyAmount ?? this.moneyAmount,
        bankAccountName: bankAccountName ?? this.bankAccountName,
        bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
        confirmationImage: confirmationImage ?? this.confirmationImage,
        status: status ?? this.status,
        reason: reason ?? this.reason,
        createdAt: createdAt ?? this.createdAt,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['money_amount'] = moneyAmount;
    map['bank_account_name'] = bankAccountName;
    map['bank_account_number'] = bankAccountNumber;
    map['confirmation_image'] = confirmationImage;
    map['status'] = status;
    map['reason'] = reason;
    map['created_at'] = createdAt;
    return map;
  }
}
