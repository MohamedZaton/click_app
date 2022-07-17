import 'dart:convert';

import 'package:click_app/src/data/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/tools/api_keys.dart';
import '../data/models/login_model.dart';

class LocalData {
  /// token
  Future<void> writeAccessToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(kAccessKey, token);
  }

  Future<void> clearAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(kAccessKey);
  }

  Future<String> readAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(kAccessKey).toString();
  }

  /// Auto Login
  Future<void> writeAutoLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool(kAutoLoginKey, true);
  }

  Future<bool> readAcceptAutoLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(kAutoLoginKey) ?? false;
  }

  Future<void> writeRejectAutoLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool(kAutoLoginKey, false);
  }

  /// profile info
  Future<void> writeProfileInfo(ProfileModel profileModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(kProfileInfoKey, jsonEncode(profileModel));
  }

  Future<ProfileModel> readProfileInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Map json = jsonDecode(prefs.getString(kProfileInfoKey).toString());

    return ProfileModel.fromJson(json);
  }

  /// Language
  Future<void> writeLanguage(String languageCode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(kLanguageKey, languageCode);
  }

  Future<String?> readLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(kLanguageKey);
  }

  /// Login password & phone
  Future<void> writeLogin(LogInModel logInModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(kLogInfoKey, jsonEncode(logInModel));
  }

  Future<LogInModel> readLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Map json = jsonDecode(prefs.getString(kLogInfoKey).toString());

    return LogInModel.fromJson(json);
  }
}
