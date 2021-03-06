import 'dart:convert';

LoginRepoModel loginRepoModelFromJson(String str) =>
    LoginRepoModel.fromJson(json.decode(str));
String loginRepoModelToJson(LoginRepoModel data) => json.encode(data.toJson());

class LoginRepoModel {
  LoginRepoModel({
    this.accessToken,
    this.tokenType,
    this.dataLoginRepo,
  });

  LoginRepoModel.fromJson(dynamic json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    dataLoginRepo =
        json['data'] != null ? DataLoginRepo.fromJson(json['data']) : null;
  }
  String? accessToken;
  String? tokenType;
  DataLoginRepo? dataLoginRepo;
  LoginRepoModel copyWith({
    String? accessToken,
    String? tokenType,
    DataLoginRepo? dataLoginRepo,
  }) =>
      LoginRepoModel(
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
        dataLoginRepo: dataLoginRepo ?? this.dataLoginRepo,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = accessToken;
    map['token_type'] = tokenType;
    if (dataLoginRepo != null) {
      map['data'] = dataLoginRepo?.toJson();
    }
    return map;
  }
}

class DataLoginRepo {
  DataLoginRepo({
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

  DataLoginRepo.fromJson(dynamic json) {
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
/*  int? active;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;*/
  DataLoginRepo copyWith({
    int? id,
    String? name,
    String? phone,
    String? email,
    String? photo,
/*    int? active,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,*/
  }) =>
      DataLoginRepo(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        photo: photo ?? this.photo,
/*        active: active ?? 0,
        createdAt: createdAt ?? "",
        updatedAt: updatedAt ?? "",
        deletedAt: deletedAt ?? "",*/
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
