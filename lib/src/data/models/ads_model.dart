import 'dart:convert';

AdsModel adsModelFromJson(String str) => AdsModel.fromJson(json.decode(str));
String adsModelToJson(AdsModel data) => json.encode(data.toJson());

class AdsModel {
  AdsModel({
    this.id,
    this.image,
  });

  AdsModel.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
  }
  int? id;
  String? image;
  AdsModel copyWith({
    int? id,
    String? image,
  }) =>
      AdsModel(
        id: id ?? this.id,
        image: image ?? this.image,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    return map;
  }

  static List<AdsModel> getListObject(List<dynamic> jsonBody) {
    List<AdsModel> itemsList =
        List<AdsModel>.from(jsonBody.map((val) => AdsModel.fromJson(val)));
    return itemsList;
  }
}
