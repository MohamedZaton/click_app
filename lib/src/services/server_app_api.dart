import 'dart:io';

import 'package:dio/dio.dart';

import '../data/models/all_models.dart';
import 'app_api.dart';
import 'local_data.dart';

class ServerAppApi implements AppApi {
  final String baseServer = 'http://clickarabstudent123.com/api/';
  var dio = Dio();

  @override
  Future<Response> postLoginRequest(LogInModel logInModel) async {
    String loginUrl = baseServer + 'student/login';
    final loginResponse = await dio.post(loginUrl, data: logInModel.toJson());
    return loginResponse;
  }

  @override
  Future<Response> getProfileInfoRequest() async {
    String url = baseServer + 'student/getProfile';
    await addTokenHeader();
    final response = await dio.get(url);
    return response;
  }

  @override
  Future<Response> getAdsRequest() async {
    String url = baseServer + 'student/adsList';
    await addTokenHeader();
    final response = await dio.get(url);
    return response;
  }

  @override
  Future<Response> getCountriesListRequest() async {
    String url = baseServer + 'student/countriesList';
    await addTokenHeader();
    final response = await dio.get(url);
    return response;
  }

  @override
  Future<Response> getCurrencyListRequest() async {
    String url = baseServer + 'student/currenciesList';
    await addTokenHeader();
    final response = await dio.get(url);
    return response;
  }

  @override
  Future<Response> getLogOutRequest() async {
    String url = baseServer + 'student/logout';
    await addTokenHeader();
    Response logOutResponse = await dio.get(url);
    String message = logOutResponse.data["message"];
    print("[LogOut] message : $message");
    return logOutResponse;
  }

  @override
  Future<Response> getServicesListRequest() async {
    String url = baseServer + 'student/servicesList';
    await addTokenHeader();
    final response = await dio.get(url);
    return response;
  }

  @override
  Future<Response> getSingleCountryRequest(int? id) async {
    String url = baseServer + 'student/singleCountry/$id';
    await addTokenHeader();
    final response = await dio.get(url);
    return response;
  }

  @override
  Future<Response> getSingleTransactionRequest(int id) async {
    String url = baseServer + 'student/singleTransaction/$id';
    await addTokenHeader();
    final response = await dio.get(url);
    return response;
  }

  @override
  Future<Response> getTransactionsListRequest(String vStatus) async {
    String url = baseServer + 'student/transactionsList?status=$vStatus';
    await addTokenHeader();
    final response = await dio.get(url);
    return response;
  }

  @override
  Future<Response> getCheckRateRequest(int countryCode, double money) async {
    String url = baseServer + 'student/checkRate/${countryCode}/${money}';
    await addTokenHeader();
    final response = await dio.get(url);
    return response;
  }

  @override
  Future<Response> getWhatsAppNumbersRequest() async {
    String url = baseServer + 'student/getWhatsAppContact';
    await addTokenHeader();
    final response = await dio.get(url);
    print("whatsapp numbers  : ${response.data.toString()}");
    return response;
  }

  @override
  Future<Response> postRegisterRequest(
      RegisterModel registerModel, File file) async {
    String registerUrl = baseServer + 'student/register';
    String fileName = file.path.split('/').last;
    var formData = FormData.fromMap({
      'name': registerModel.name,
      'phone': registerModel.phone,
      'email': registerModel.email,
      'password': registerModel.password,
      'photo': await MultipartFile.fromFile(file.path, filename: fileName),
    });
    final RegisterResponse = await dio.post(registerUrl, data: formData);
    return RegisterResponse;
  }

  @override
  Future<Response> putProfileInfoRequest(
      RegisterModel registerModel, File file) async {
    String url = baseServer + 'student/updateProfile';

    await addTokenHeader();
    var formData;
    try {
      String fileName = file.path.split('/').last;

      formData = FormData.fromMap({
        'name': registerModel.name,
        'phone': registerModel.phone,
        'email': registerModel.email,
        'photo': await MultipartFile.fromFile(file.path, filename: fileName),
      });
    } catch (e) {
      print("error:${e.toString()}");
    }

    final response = await dio.post(url, data: formData);
    return response;
  }

  @override
  Future<Response> postTransactionRequest(
      TransactionModel transactionModel, File file) async {
    String url = baseServer + 'student/makeTransaction';
    String fileName = file.path.split('/').last;

    await addTokenHeader();
    transactionModel.copyWith(
      confirmationImage:
          await MultipartFile.fromFile(file.path, filename: fileName),
    );
    var formData = FormData.fromMap({
      'money_amount': transactionModel.moneyAmount,
      'bank_account_name': transactionModel.bankAccountName,
      'bank_account_number': transactionModel.bankAccountNumber,
      'confirmation_image':
          await MultipartFile.fromFile(file.path, filename: fileName),
    });
    final response = await dio.post(url, data: formData);
    return response;
  }

  @override
  Future<Response> postUniversityPaymentTransactionRequest(
    UniversityPaymentModel universityPaymentModel,
    File confImage,
    File passportImage,
    File idImage,
  ) async {
    String url = baseServer + 'student/makeUniversityPayment';
    String confName = confImage.path.split('/').last;
    String passportName = passportImage.path.split('/').last;
    String idImgName = idImage.path.split('/').last;

    await addTokenHeader();
    var formData = FormData.fromMap({
      'money_amount': universityPaymentModel.moneyAmount,
      'bank_account_name': universityPaymentModel.bankAccountName,
      'bank_account_number': universityPaymentModel.bankAccountNumber,
      'confirmation_image':
          await MultipartFile.fromFile(confImage.path, filename: confName),
      'passport_image': await MultipartFile.fromFile(passportImage.path,
          filename: passportName),
      'id_image':
          await MultipartFile.fromFile(idImage.path, filename: idImgName),
    });

    final response = await dio.post(url, data: formData);
    return response;
  }

  Future<void> addTokenHeader() async {
    String token = await LocalData().readAccessToken();
    dio.options.headers["Authorization"] = "Bearer ${token}";
    dio.options.headers["Accept"] = 'application/json';
  }
}
