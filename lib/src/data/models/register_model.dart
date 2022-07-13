import 'dart:convert';

import 'package:dio/dio.dart';

RegisterModel registerRespoModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));
String registerRespoModelToJson(RegisterModel data) =>
    json.encode(data.toJson());

class RegisterModel {
  String? name;
  String? phone;
  String? email;
  String? password;
  MultipartFile? photo;
  RegisterModel({
    this.name,
    this.phone,
    this.email,
    this.password,
    this.photo,
  });

  RegisterModel.fromJson(dynamic json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    photo = json['photo'];
  }

  RegisterModel copyWith({
    String? name,
    String? phone,
    String? email,
    String? password,
    MultipartFile? photo,
  }) =>
      RegisterModel(
        name: name ?? this.name,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        password: password ?? this.password,
        photo: photo ?? this.photo,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
    map['password'] = password;
    map['photo'] = photo;
    return map;
  }
}
