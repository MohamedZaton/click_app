import 'dart:convert';

RegisterRepoModel registerRepoModelFromJson(String str) =>
    RegisterRepoModel.fromJson(json.decode(str));
String registerRepoModelToJson(RegisterRepoModel data) =>
    json.encode(data.toJson());

class RegisterRepoModel {
  RegisterRepoModel({
    this.accessToken,
    this.tokenType,
    this.dataRegisterRepo,
  });

  RegisterRepoModel.fromJson(dynamic json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    dataRegisterRepo =
        json['data'] != null ? DataRegisterRepo.fromJson(json['data']) : null;
  }
  String? accessToken;
  String? tokenType;
  DataRegisterRepo? dataRegisterRepo;
  RegisterRepoModel copyWith({
    String? accessToken,
    String? tokenType,
    DataRegisterRepo? dataRegisterRepo,
  }) =>
      RegisterRepoModel(
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
        dataRegisterRepo: dataRegisterRepo ?? this.dataRegisterRepo,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = accessToken;
    map['token_type'] = tokenType;
    if (dataRegisterRepo != null) {
      map['data'] = dataRegisterRepo?.toJson();
    }
    return map;
  }
}

class DataRegisterRepo {
  DataRegisterRepo({
    this.name,
    this.phone,
    this.email,
    this.photo,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  DataRegisterRepo.fromJson(dynamic json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    photo = json['photo'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
  String? name;
  String? phone;
  String? email;
  String? photo;
  String? updatedAt;
  String? createdAt;
  int? id;
  DataRegisterRepo copyWith({
    String? name,
    String? phone,
    String? email,
    String? photo,
    String? updatedAt,
    String? createdAt,
    int? id,
  }) =>
      DataRegisterRepo(
        name: name ?? this.name,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        photo: photo ?? this.photo,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
    map['photo'] = photo;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    return map;
  }
}
