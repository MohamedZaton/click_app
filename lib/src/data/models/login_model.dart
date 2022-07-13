import 'dart:convert';

LogInModel logInModelFromJson(String str) =>
    LogInModel.fromJson(json.decode(str));
String logInModelToJson(LogInModel data) => json.encode(data.toJson());

class LogInModel {
  LogInModel({
    this.email,
    this.password,
  });

  LogInModel.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
  }
  String? email;
  String? password;
  LogInModel copyWith({
    String? email,
    String? password,
  }) =>
      LogInModel(
        email: email ?? this.email,
        password: password ?? this.password,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }
}
