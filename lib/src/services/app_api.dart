import 'dart:io';

import 'package:click_app/src/data/models/TransactionModel.dart';
import 'package:dio/dio.dart';

import '../data/models/login_model.dart';
import '../data/models/register_model.dart';
import '../data/models/university_payment_model.dart';

abstract class AppApi {
  /// Auth Methods
  Future<Response> postRegisterRequest(RegisterModel registerModel, File file);
  Future<Response> postLoginRequest(LogInModel logInModel);
  Future<Response> getProfileInfoRequest();
  Future<Response> putProfileInfoRequest(
      RegisterModel registerModel, File file);
  Future<Response> getLogOutRequest();

  /// Currency Method
  Future<Response> getCountriesListRequest();
  Future<Response> getCurrencyListRequest();
  Future<Response> getServicesListRequest();
  Future<Response> getTransactionsListRequest(String vStatus);
  Future<Response> getWhatsAppNumbersRequest();
  Future<Response> getAdsRequest();
  Future<Response> getSingleCountryRequest(int? id);
  Future<Response> getSingleTransactionRequest(int id);
  Future<Response> postTransactionRequest(
      TransactionModel transactionModel, File file);
  Future<Response> postUniversityPaymentTransactionRequest(
    UniversityPaymentModel universityPaymentModel,
    File confImage,
    File passportImage,
    File idImage,
  );
}
