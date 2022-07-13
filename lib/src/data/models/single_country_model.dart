import 'dart:convert';

SingleCountryModel singleCountryModelFromJson(String str) =>
    SingleCountryModel.fromJson(json.decode(str));
String singleCountryModelToJson(SingleCountryModel data) =>
    json.encode(data.toJson());

class SingleCountryModel {
  SingleCountryModel({
    this.dataSingleCountry,
  });

  SingleCountryModel.fromJson(dynamic json) {
    dataSingleCountry =
        json['data'] != null ? DataSingleCountry.fromJson(json['data']) : null;
  }
  DataSingleCountry? dataSingleCountry;
  SingleCountryModel copyWith({
    DataSingleCountry? dataSingleCountry,
  }) =>
      SingleCountryModel(
        dataSingleCountry: dataSingleCountry ?? this.dataSingleCountry,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (dataSingleCountry != null) {
      map['data'] = dataSingleCountry?.toJson();
    }
    return map;
  }
}

class DataSingleCountry {
  DataSingleCountry(
      {this.id,
      this.nameEn,
      this.nameAr,
      this.flag,
      this.descriptionEn,
      this.descriptionAr,
      this.contactPhone,
      this.contactPhone2,
      this.code,
      this.currencyId,
      h});

  DataSingleCountry.fromJson(dynamic json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    flag = json['flag'];
    descriptionEn = json['description_en'];
    descriptionAr = json['description_ar'];
    contactPhone = json['contact_phone'];
    contactPhone2 = json['contact_phone_2'];
    code = json['code'];
    currencyId = json['currency_id'];
  }
  int? id;
  String? nameEn;
  String? nameAr;
  String? flag;
  String? descriptionEn;
  String? descriptionAr;
  String? contactPhone;
  dynamic contactPhone2;
  String? code;
  int? currencyId;
  DataSingleCountry copyWith({
    int? id,
    String? nameEn,
    String? nameAr,
    String? flag,
    String? descriptionEn,
    String? descriptionAr,
    String? contactPhone,
    dynamic contactPhone2,
    String? code,
    int? currencyId,
  }) =>
      DataSingleCountry(
        id: id ?? this.id,
        nameEn: nameEn ?? this.nameEn,
        nameAr: nameAr ?? this.nameAr,
        flag: flag ?? this.flag,
        descriptionEn: descriptionEn ?? this.descriptionEn,
        descriptionAr: descriptionAr ?? this.descriptionAr,
        contactPhone: contactPhone ?? this.contactPhone,
        contactPhone2: contactPhone2 ?? this.contactPhone2,
        code: code ?? this.code,
        currencyId: currencyId ?? this.currencyId,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name_en'] = nameEn;
    map['name_ar'] = nameAr;
    map['flag'] = flag;
    map['description_en'] = descriptionEn;
    map['description_ar'] = descriptionAr;
    map['contact_phone'] = contactPhone;
    map['contact_phone_2'] = contactPhone2;
    map['code'] = code;
    map['currency_id'] = currencyId;
    return map;
  }
}
