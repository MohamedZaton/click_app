import 'dart:convert';

CurrenciesListModel currenciesListModelFromJson(String str) =>
    CurrenciesListModel.fromJson(json.decode(str));
String currenciesListModelToJson(CurrenciesListModel data) =>
    json.encode(data.toJson());

class CurrenciesListModel {
  CurrenciesListModel({
    this.dataCurrenciesList,
  });

  CurrenciesListModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      dataCurrenciesList = [];
      json['data'].forEach((v) {
        dataCurrenciesList?.add(DataCurrenciesList.fromJson(v));
      });
    }
  }
  List<DataCurrenciesList>? dataCurrenciesList;
  CurrenciesListModel copyWith({
    List<DataCurrenciesList>? dataCurrenciesList,
  }) =>
      CurrenciesListModel(
        dataCurrenciesList: dataCurrenciesList ?? this.dataCurrenciesList,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (dataCurrenciesList != null) {
      map['data'] = dataCurrenciesList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

DataCurrenciesList dataFromJson(String str) =>
    DataCurrenciesList.fromJson(json.decode(str));
String dataToJson(DataCurrenciesList data) => json.encode(data.toJson());

class DataCurrenciesList {
  DataCurrenciesList({
    this.id,
    this.code,
    this.flag,
  });

  DataCurrenciesList.fromJson(dynamic json) {
    id = json['id'];
    code = json['code'];
    flag = json['flag'];
  }
  int? id;
  String? code;
  String? flag;
  DataCurrenciesList copyWith({
    int? id,
    String? code,
    String? flag,
  }) =>
      DataCurrenciesList(
        id: id ?? this.id,
        code: code ?? this.code,
        flag: flag ?? this.flag,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['code'] = code;
    map['flag'] = flag;
    return map;
  }
}
