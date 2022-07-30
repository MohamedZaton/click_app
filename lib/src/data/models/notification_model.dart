import 'dart:convert';

import 'package:dio/dio.dart';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));
String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  NotificationModel({
    this.id,
    this.title,
    this.body,
    this.studentId,
    this.createdAt,
    this.updatedAt,
  });

  NotificationModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    studentId = json['student_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? title;
  String? body;
  String? studentId;
  String? createdAt;
  String? updatedAt;
  NotificationModel copyWith({
    int? id,
    String? title,
    String? body,
    String? studentId,
    String? createdAt,
    String? updatedAt,
  }) =>
      NotificationModel(
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
        studentId: studentId ?? this.studentId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['body'] = body;
    map['student_id'] = studentId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

  static List<NotificationModel> getListObject(Response response) {
    return (response.data as List)
        .map((x) => NotificationModel.fromJson(x))
        .toList();
  }
}
