import 'package:click_app/src/presentation/getx/currency_exchange_controller.dart';
import 'package:click_app/src/presentation/getx/history_controller.dart';
import 'package:click_app/src/presentation/getx/pay_countries_controller.dart';
import 'package:click_app/src/presentation/getx/prizes_controller.dart';
import 'package:click_app/src/presentation/getx/setting_controller.dart';
import 'package:click_app/src/presentation/pages/history/history_view.dart';
import 'package:click_app/src/presentation/pages/history_detail/history_view_detail.dart';
import 'package:click_app/src/presentation/pages/language_list/language_list_controller.dart';
import 'package:click_app/src/presentation/pages/payment_countries/pay_countries_view.dart';
import 'package:click_app/src/presentation/pages/payment_countries/pay_details_view.dart';
import 'package:click_app/src/presentation/pages/payment_countries/pay_forms_view.dart';
import 'package:click_app/src/presentation/pages/payment_countries/pay_university_view.dart';
import 'package:click_app/src/presentation/pages/prizes/prizes_view.dart';
import 'package:click_app/src/presentation/pages/profile/profile_controller.dart';
import 'package:click_app/src/presentation/pages/profile/profile_view.dart';
import 'package:click_app/src/presentation/pages/setting/setting_view.dart';
import 'package:click_app/src/presentation/pages/sign_up/sign_up_view.dart';
import 'package:get/get.dart';

import '../../presentation/getx/home_controller.dart';
import '../../presentation/getx/sign_in_controller.dart';
import '../../presentation/getx/sign_up_controller.dart';
import '../../presentation/getx/splash_controller.dart';
import '../../presentation/pages/currency_exchange/currency_exchange_view.dart';
import '../../presentation/pages/home/home_view.dart';
import '../../presentation/pages/language_list/language_list_view.dart';
import '../../presentation/pages/messages/message_view.dart';
import '../../presentation/pages/sign_in/sign_in_view.dart';
import '../../presentation/pages/splash/splash_view.dart';

class AppRoutes {
  static List<GetPage<dynamic>>? onGenerateRoutes() {
    return [
      GetPage(
        name: HomePage.id,
        page: () => HomePage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<HomeController>(() => HomeController());
        }),
      ),
      GetPage(
        name: SignInPage.id,
        page: () => SignInPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<SignInController>(() => SignInController());
        }),
      ),
      GetPage(
        name: SignUpPage.id,
        page: () => SignUpPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<SignUpController>(() => SignUpController());
        }),
      ),
      GetPage(
        name: SplashPage.id,
        page: () => SplashPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<SplashController>(() => SplashController());
        }),
      ),
      GetPage(
        name: CurrencyExchangePage.id,
        page: () => CurrencyExchangePage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<CurrencyExchangeController>(
              () => CurrencyExchangeController());
        }),
      ),
      GetPage(
        name: PrizesPage.id,
        page: () => PrizesPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<PrizesController>(() => PrizesController());
        }),
      ),
      GetPage(
        name: HistoryPage.id,
        page: () => HistoryPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<HistoryController>(() => HistoryController());
        }),
      ),
      GetPage(
        name: HistoryDetailPage.id,
        page: () => SettingPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<HistoryController>(() => HistoryController());
        }),
      ),
      GetPage(
        name: SettingPage.id,
        page: () => SettingPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<SettingController>(() => SettingController());
        }),
      ),
      GetPage(
        name: ProfilePage.id,
        page: () => ProfilePage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<ProfileController>(() => ProfileController());
        }),
      ),
      GetPage(
        name: PaymentCountriesPage.id,
        page: () => PaymentCountriesPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<PaymentCountriesController>(
              () => PaymentCountriesController());
        }),
      ),
      GetPage(
        name: PayDetailsPage.id,
        page: () => PayDetailsPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<PaymentCountriesPage>(() => PaymentCountriesPage());
        }),
      ),
      GetPage(
        name: PayFormsPage.id,
        page: () => PayFormsPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<PaymentCountriesPage>(() => PaymentCountriesPage());
        }),
      ),
      GetPage(
        name: PayUniversityPage.id,
        page: () => PayUniversityPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<PaymentCountriesPage>(() => PaymentCountriesPage());
        }),
      ),
      GetPage(
        name: LanguageListPage.id,
        page: () => LanguageListPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<LanguageListController>(() => LanguageListController());
        }),
      ),
      GetPage(
        name: MessagesPage.id,
        page: () => MessagesPage(),
      ),
    ];
  }
}
