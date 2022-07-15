import 'dart:convert';

import 'package:dio/dio.dart';

ServiceModel ServiceModelFromJson(String str) =>
    ServiceModel.fromJson(json.decode(str));
String ServiceModelToJson(ServiceModel data) => json.encode(data.toJson());

class ServiceModel {
  ServiceModel({
    this.id,
    this.logo,
    this.titleEn,
    this.descriptionEn,
  });

  ServiceModel.fromJson(dynamic json) {
    id = json['id'];
    logo = json['logo'];
    titleEn = json['title_en'];
    descriptionEn = json['description_en'];
  }
  int? id;
  String? logo;
  String? titleEn;
  String? descriptionEn;
  ServiceModel copyWith({
    int? id,
    String? logo,
    String? titleEn,
    String? descriptionEn,
  }) =>
      ServiceModel(
        id: id ?? this.id,
        logo: logo ?? this.logo,
        titleEn: titleEn ?? this.titleEn,
        descriptionEn: descriptionEn ?? this.descriptionEn,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['logo'] = logo;
    map['title_en'] = titleEn;
    map['description_en'] = descriptionEn;
    return map;
  }

  static List<ServiceModel> getListObject(Response response) {
    return (response.data as List)
        .map((x) => ServiceModel.fromJson(x))
        .toList();
  }
}
