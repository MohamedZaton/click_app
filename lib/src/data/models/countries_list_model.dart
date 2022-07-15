import 'dart:convert';

import 'package:dio/dio.dart';

CountriesListModel countriesListModelFromJson(String str) =>
    CountriesListModel.fromJson(json.decode(str));
String countriesListModelToJson(CountriesListModel data) =>
    json.encode(data.toJson());

class CountriesListModel {
  CountriesListModel({
    this.id,
    this.flag,
    this.nameEn,
  });

  CountriesListModel.fromJson(dynamic json) {
    id = json['id'];
    flag = json['flag'];
    nameEn = json['name_en'];
  }
  int? id;
  String? flag;
  String? nameEn;
  CountriesListModel copyWith({
    int? id,
    String? flag,
    String? nameEn,
  }) =>
      CountriesListModel(
        id: id ?? this.id,
        flag: flag ?? this.flag,
        nameEn: nameEn ?? this.nameEn,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['flag'] = flag;
    map['name_en'] = nameEn;
    return map;
  }

  static List<CountriesListModel> getListObject(Response response) {
    return (response.data as List)
        .map((x) => CountriesListModel.fromJson(x))
        .toList();
  }
}
