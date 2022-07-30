import 'dart:io';

import 'package:click_app/src/core/tools/api_keys.dart';
import 'package:click_app/src/data/models/all_models.dart';
import 'package:click_app/src/presentation/getx/currency_exchange_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/utils/constants.dart';
import '../../data/repositories/StudentRepositoryImpl.dart';
import '../pages/home/home_view.dart';
import '../pages/payment_countries/pay_details_view.dart';

class PaymentCountriesController extends GetxController {
  bool isLoading = false;
  final ImagePicker _picker = ImagePicker();
  final exchangeLogic = Get.find<CurrencyExchangeController>();

  /// university payment money ...{

  bool isAttachedConfImage = false;
  bool isAttachedPassportImage = false;
  bool isAttachedIdImage = false;
  File confImage = new File('');
  String? confImagePath = kAvatarImage;
  File passportImage = new File('');
  String? passportImagePath = kAvatarImage;
  File idImage = new File('');
  String? idImagePath = kAvatarImage;
  String? countryRubRate = "";
  List<String> numbersWatsappList = [];
  DataSingleCountry dataSingleCountry = DataSingleCountry();

  /// university payment money }...

  List<CountriesListModel> countryList = [];

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
    getWhatsAppNumbers();
    getCountryList();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<File> getImages(
      {required String imagePath,
      required bool isAttached,
      required File image}) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      imagePath = pickedFile.path;
      print(imagePath);
      isAttached = true;

      update();
    } else {
      print('No image selected.');
    }
    update();
    return image;
  }

  /// university payment money and Payment Form  { ...
  /// 1. university payment
  Future<void> payUniversityRequest(
      UniversityPaymentModel universityPaymentModel) async {
    isLoading = true;
    final responce = await StudentRepositoryImpl()
        .makeUniversityPaymentTransaction(
            universityPaymentModel, confImage, passportImage, idImage);

    responce.fold((l) {
      //error
      Get.snackbar(kSignUpTxt, kSignUpFailedText, backgroundColor: Colors.red);
      isLoading = false;
      Get.offAll(() => HomePage(), arguments: [
        {kChangeTabIndexKey: 2}
      ]);
      return;
    }, (r) {
      //success
      print("[payUniversityRequest ] pay : $r");
      Get.snackbar(kPayUnvMoneyTxt, kPaymentSuccessText,
          backgroundColor: Colors.green);

      isLoading = false;
      Get.offAll(() => HomePage(), arguments: [
        {kChangeTabIndexKey: 2}
      ]);
      return;
    });
    update();
  }

  /// 2.  Payment Form
  Future<void> paymentForm(TransactionModel transactionModel) async {
    isLoading = true;
    final responce = await StudentRepositoryImpl()
        .postMakeTransaction(transactionModel, confImage);
    responce.fold((l) {
      //error
      Get.snackbar(kFormPayTxt, kSignUpFailedText, backgroundColor: Colors.red);
      isLoading = false;
      Get.offAll(() => HomePage(), arguments: [
        {kChangeTabIndexKey: 2}
      ]);
      return;
    }, (r) {
      //success
      print("[paymentFormRequest ] pay : $r");
      Get.snackbar(kFormPayTxt, kPaymentSuccessText,
          backgroundColor: Colors.green);

      isLoading = false;
      Get.offAll(() => HomePage(), arguments: [
        {kChangeTabIndexKey: 2}
      ]);
      return;
    });
    update();
  }

  Future<void> getConfImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      confImage = File(pickedFile.path);
      confImagePath = pickedFile.path;
      print("[getConfImage] $confImagePath");
      isAttachedConfImage = true;

      update();
    } else {
      print('No image selected.');
    }
    update();
  }

  Future<void> getPassportImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      passportImage = File(pickedFile.path);
      passportImagePath = pickedFile.path;
      print("[getConfImage] $confImagePath");
      isAttachedPassportImage = true;

      update();
    } else {
      print('No image selected.');
    }
    update();
  }

  Future<void> getIdImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      idImage = File(pickedFile.path);
      idImagePath = pickedFile.path;
      print("[getConfImage] $confImagePath");
      isAttachedIdImage = true;

      update();
    } else {
      print('No image selected.');
    }
    update();
  }

  /// university payment money }...

  /// whatsapp button
  void getWhatsAppNumbers() async {
    final response = await StudentRepositoryImpl().getWhatsAppNumbers();
    response.fold((failure) {
      print("[getWhatsAppNumbers] error : ${failure.message}");
      update();
      return;
    }, (whatsAppNumbers) {
      numbersWatsappList = whatsAppNumbers;
      update();
      return;
    });
  }

  /// getCountry list
  void getCountryList() async {
    final response = await StudentRepositoryImpl().getCountriesList();
    response.fold((failure) {
      print("[getWhatsAppNumbers] error : ${failure.message}");
      update();
      return;
    }, (countryListresponse) {
      countryList = countryListresponse;
      getRubRate(exchangeLogic.selectedCountryCurrency.value.id!,
          exchangeLogic.selectedCountryCurrency.value.code.toString());
      update();
      return;
    });
  }

  Future<void> getSingleCountryAndGoDetails(int id) async {
    isLoading = true;
    final response = await StudentRepositoryImpl().getSingleCountryRequest(id);
    response.fold((failure) {
      print("[getSingleCountry] error : ${failure.message}");
      update();
      isLoading = false;

      return;
    }, (singleCountryInfo) {
      dataSingleCountry = singleCountryInfo;
      getRubRate(id, dataSingleCountry.code.toString());
      Get.to(() => PayDetailsPage());
      isLoading = false;

      update();
      return;
    });

    update();
  }

  Future<void> getRubRate(int countryCode, String countryName) async {
    final response = await StudentRepositoryImpl().getCheckRate(countryCode, 1);
    response.fold((l) {
      print("[getRussaRate] error: " + l.message);
      return;
    }, (rubEqual) {
      countryRubRate = "$rubEqual $countryName";
      return;
    });
    update();
  }
}
