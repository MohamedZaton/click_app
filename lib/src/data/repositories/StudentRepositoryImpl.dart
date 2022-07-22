import 'dart:io';

import 'package:click_app/src/core/error/failure.dart';
import 'package:click_app/src/data/models/all_models.dart';
import 'package:click_app/src/domain/repositories/student_repository.dart';
import 'package:click_app/src/services/server_app_api.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import '../../core/network/network_info.dart';
import '../../core/utils/constants.dart';
import '../../services/local_data.dart';

class StudentRepositoryImpl implements StudentRepository {
  @override
  Future<Either<Failure, List<AdsModel>>> getAdsList() async {
    Response response = await ServerAppApi().getAdsRequest();
    try {
      List<AdsModel> adsList = AdsModel.getListObject(response);
      return right(adsList);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  @override
  Future<Either<Failure, String>> getCheckRate(
      int countryCode, double money) async {
    Response response =
        await ServerAppApi().getCheckRateRequest(countryCode, money);
    try {
      return right(response.toString());
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  @override
  Future<Either<Failure, List<CountriesListModel>>> getCountriesList() async {
    Response response = await ServerAppApi().getCountriesListRequest();
    try {
      List<CountriesListModel> countryListModel =
          CountriesListModel.getListObject(response);

      return right(countryListModel);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  @override
  Future<Either<Failure, List<DataCurrenciesModel>>> getCurrencyList() async {
    Response response = await ServerAppApi().getCurrencyListRequest();
    try {
      CurrenciesListModel currenciesListModel =
          CurrenciesListModel.fromJson(response.data);
      List<DataCurrenciesModel>? currenciesList =
          currenciesListModel.dataCurrenciesList;
      return right(currenciesList!);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  @override
  Future<Either<Failure, String>> getLogOut() async {
    LocalData().clearAccessToken();
    LocalData().writeRejectAutoLogin();
    Response response = await ServerAppApi().getLogOutRequest();

    try {
      String message = response.data['message'];

      return right(message);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  @override
  Future<Either<Failure, DataProfile>> getProfileInfo() async {
    Response response = await ServerAppApi().getProfileInfoRequest();
    try {
      ProfileModel profileModel = ProfileModel.fromJson(response.data);
      DataProfile? dataProfileInfo = profileModel.dataProfile;
      return right(dataProfileInfo!);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  @override
  Future<Either<Failure, List<ServiceModel>>> getServicesList() async {
    Response response = await ServerAppApi().getServicesListRequest();
    try {
/*      List<ServiceModel> serviceModel =
          (response.data as List).map((x) => ServiceModel.fromJson(x)).toList();*/
      List<ServiceModel> serviceModel = ServiceModel.getListObject(response);
      return right(serviceModel);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  @override
  Future<Either<Failure, DataSingleCountry>> getSingleCountryRequest(
      int? id) async {
    Response response = await ServerAppApi().getSingleCountryRequest(id);
    try {
      SingleCountryModel singleCountryModel =
          SingleCountryModel.fromJson(response.data);
      DataSingleCountry? dataSingleCountry =
          singleCountryModel.dataSingleCountry;
      return right(dataSingleCountry!);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  @override
  Future<Either<Failure, DataSingleTransactionModel>>
      getSingleTransactionRequest(int id) async {
    Response response = await ServerAppApi().getSingleTransactionRequest(id);
    try {
      SingleTransactionModel singleTransactionModel =
          SingleTransactionModel.fromJson(response.data);
      DataSingleTransactionModel? dataSingleTransactionModel =
          singleTransactionModel.dataSingleTransactionModel;
      return right(dataSingleTransactionModel!);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  @override
  Future<Either<Failure, List<TransactionsListModel>>> getTransactionsList(
      String status) async {
    Response response = await ServerAppApi().getTransactionsListRequest(status);
    try {
      List<TransactionsListModel> transactionList =
          TransactionsListModel.getListObject(response);
      return right(transactionList);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getWhatsAppNumbers() async {
    Response response = await ServerAppApi().getWhatsAppNumbersRequest();
    try {
      String numbersText = response.data.toString();
      List<String> numbersWhatsAppList =
          numbersText.substring(1, numbersText.length - 1).split(',');
      print("numbersWatsappList 0 :${numbersWhatsAppList[0].toString()}");
      return right(numbersWhatsAppList);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  @override
  Future<Either<Failure, LoginRepoModel>> postLogin(
      LogInModel logInModel) async {
    Response response = await ServerAppApi().postLoginRequest(logInModel);

    try {
      LoginRepoModel logInRepoModel = LoginRepoModel.fromJson(response.data);
      String _token = logInRepoModel.accessToken.toString();

      /// save token
      LocalData().writeAccessToken(_token);
      LocalData().writeAutoLogin();
      LocalData().writeLogin(logInModel);

      print("token : " + _token);
      return right(logInRepoModel);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> postMakeTransaction(
      TransactionModel transactionModel, File file) async {
    Response response =
        await ServerAppApi().postTransactionRequest(transactionModel, file);
    try {
      bool isSuccess = response.data["success"];
      return right(isSuccess);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  @override
  Future<Either<Failure, RegisterRepoModel>> postRegister(
      RegisterModel registerModel, File image) async {
    Response response =
        await ServerAppApi().postRegisterRequest(registerModel, image);
    LocalData().writeAutoLogin();
    LocalData().writeLogin(LogInModel(
        email: registerModel.email, password: registerModel.password));
    try {
      RegisterRepoModel responseModel =
          RegisterRepoModel.fromJson(response.data);
      String _token = responseModel.accessToken.toString();

      /// save token
      LocalData().writeAccessToken(_token);

      print("token : " + _token);
      return right(responseModel);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> makeUniversityPaymentTransaction(
      UniversityPaymentModel universityPaymentModel,
      File confImage,
      File passportImage,
      File idImage) async {
    Response response = await ServerAppApi()
        .postUniversityPaymentTransactionRequest(
            universityPaymentModel, confImage, passportImage, idImage);
    try {
      bool isSuccess = response.data["success"];
      return right(isSuccess);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> putProfileInfo(
      RegisterModel registerModel, File file) async {
    Response response =
        await ServerAppApi().putProfileInfoRequest(registerModel, file);
    try {
      bool isSuccess = response.data["success"];
      return right(isSuccess);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  Future<String> errorMessage(Response response) async {
    bool isConnect = await NetworkInfoImpl().isConnected;
    String msg = response.statusMessage ?? "";
    if (!isConnect) {
      msg = kNoNetworkTxt.tr;
      return msg;
    }
    switch (response.statusCode) {
      case 500:
        {
          msg = kNoServerTxt.tr;
          break;
        }
      case 401:
        {
          msg = kWrongPwdOrPhoneTxt.tr;
          break;
        }
      case 403:
        {
          msg = kWrongPwdOrPhoneTxt.tr;
          break;
        }
      default:
        {
          msg = kErrorResponseTxt;
          break;
        }
    }

    return msg;
  }
}
