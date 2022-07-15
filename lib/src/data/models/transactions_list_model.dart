import 'dart:convert';

import 'package:dio/dio.dart';

TransactionsListModel transactionsListModelFromJson(String str) =>
    TransactionsListModel.fromJson(json.decode(str));
String transactionsListModelToJson(TransactionsListModel data) =>
    json.encode(data.toJson());

class TransactionsListModel {
  TransactionsListModel({
    this.id,
    this.moneyAmount,
  });

  TransactionsListModel.fromJson(dynamic json) {
    id = json['id'];
    moneyAmount = json['money_amount'];
  }
  int? id;
  double? moneyAmount;
  TransactionsListModel copyWith({
    int? id,
    double? moneyAmount,
  }) =>
      TransactionsListModel(
        id: id ?? this.id,
        moneyAmount: moneyAmount ?? this.moneyAmount,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['money_amount'] = moneyAmount;
    return map;
  }

  static List<TransactionsListModel> getListObject(Response response) {
    return (response.data as List)
        .map((x) => TransactionsListModel.fromJson(x))
        .toList();
  }
}
