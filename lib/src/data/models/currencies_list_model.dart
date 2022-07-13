import 'dart:convert';

CurrenciesListModel currenciesListModelFromJson(String str) =>
    CurrenciesListModel.fromJson(json.decode(str));
String currenciesListModelToJson(CurrenciesListModel data) =>
    json.encode(data.toJson());

class CurrenciesListModel {
  CurrenciesListModel({
    this.data,
  });

  CurrenciesListModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? data;
  CurrenciesListModel copyWith({
    List<Data>? data,
  }) =>
      CurrenciesListModel(
        data: data ?? this.data,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    this.id,
    this.code,
    this.flag,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    code = json['code'];
    flag = json['flag'];
  }
  int? id;
  String? code;
  String? flag;
  Data copyWith({
    int? id,
    String? code,
    String? flag,
  }) =>
      Data(
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
