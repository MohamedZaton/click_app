import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));
String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.success,
    this.dataProfile,
  });

  ProfileModel.fromJson(dynamic json) {
    success = json['success'];
    dataProfile =
        json['data'] != null ? DataProfile.fromJson(json['data']) : null;
  }
  bool? success;
  DataProfile? dataProfile;
  ProfileModel copyWith({
    bool? success,
    DataProfile? dataProfile,
  }) =>
      ProfileModel(
        success: success ?? this.success,
        dataProfile: dataProfile ?? this.dataProfile,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (dataProfile != null) {
      map['data'] = dataProfile?.toJson();
    }
    return map;
  }
}

class DataProfile {
  DataProfile({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.photo,
/*    this.active,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,*/
  });

  DataProfile.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    photo = json['photo'];
/*    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];*/
  }
  int? id;
  String? name;
  String? phone;
  String? email;
  String? photo;
/*  String? active;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;*/
  DataProfile copyWith({
    int? id,
    String? name,
    String? phone,
    String? email,
    String? photo,
/*    String? active,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,*/
  }) =>
      DataProfile(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        photo: photo ?? this.photo,
/*        active: active ?? this.active,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,*/
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
    map['photo'] = photo;
/*    map['active'] = active;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;*/
    return map;
  }
}
