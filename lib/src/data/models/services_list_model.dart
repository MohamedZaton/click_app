import 'dart:convert';

ServicesListModel servicesListModelFromJson(String str) =>
    ServicesListModel.fromJson(json.decode(str));
String servicesListModelToJson(ServicesListModel data) =>
    json.encode(data.toJson());

class ServicesListModel {
  ServicesListModel({
    this.id,
    this.logo,
    this.titleEn,
    this.descriptionEn,
  });

  ServicesListModel.fromJson(dynamic json) {
    id = json['id'];
    logo = json['logo'];
    titleEn = json['title_en'];
    descriptionEn = json['description_en'];
  }
  int? id;
  String? logo;
  String? titleEn;
  String? descriptionEn;
  ServicesListModel copyWith({
    int? id,
    String? logo,
    String? titleEn,
    String? descriptionEn,
  }) =>
      ServicesListModel(
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

  static List<ServicesListModel> getListObject(List<dynamic> jsonBody) {
    List<ServicesListModel> itemsList = List<ServicesListModel>.from(
        jsonBody.map((val) => ServicesListModel.fromJson(val)));
    return itemsList;
  }
}
