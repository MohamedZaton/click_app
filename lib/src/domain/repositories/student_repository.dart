import 'dart:io';

import 'package:click_app/src/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/all_models.dart';

abstract class StudentRepository {
  Future<Either<Failure, LoginRepoModel>> postLogin(LogInModel logInModel);
  Future<Either<Failure, DataProfile>> getProfileInfo();
  Future<Either<Failure, List<AdsModel>>> getAdsList();

  Future<Either<Failure, List<CountriesListModel>>> getCountriesList();
  Future<Either<Failure, List<DataCurrenciesModel>>> getCurrencyList();
  Future<Either<Failure, String>> getLogOut();
  Future<Either<Failure, List<String>>> getWhatsAppNumbers();
  Future<Either<Failure, String>> getCheckRate(int countryCode, double money);

  Future<Either<Failure, List<ServicesListModel>>> getServicesList();

  Future<Either<Failure, DataSingleCountry>> getSingleCountryRequest(int? id);
  Future<Either<Failure, SingleTransactionModel>> getSingleTransactionRequest(
      int id);
  Future<Either<Failure, List<TransactionsListModel>>> getTransactionsList(
      String status);
  Future<Either<Failure, RegisterRepoModel>> postRegister(
      RegisterModel registerModel, File image);

  Future<Either<Failure, bool>> putProfileInfo(
      RegisterModel registerModel, File file);

  Future<Either<Failure, bool>> postMakeTransaction(
      TransactionModel transactionModel, File file);

  Future<Either<Failure, bool>> putMakeUniversityPaymentTransaction(
    UniversityPaymentModel universityPaymentModel,
    File confImage,
    File passportImage,
    File idImage,
  );
}
