import '../../data/models/currency_model.dart';
import 'images_path.dart';

/// website links
const String kBaseUrl = "https://api.themoviedb.org";
const String kImageUrlSmall = "https://image.tmdb.org/t/p/w200/";

// text
const String kFullNameTxt = "Full Name";
const String kOnlineTxt = "Online";
const String kOfflineTxt = "Offline";
const String kAvatarImage = "assets/images/user.png";

const String kTitleTxt = "Title";
const String kHelloLogInTxt = "Hello\nLogin!";
const String kCreateAccountTxt = "CreateYour\nAccount";
const String kEmailTxt = "Email";
const String kPasswordTxt = "Password";
const String kSuccessTxt = "Success";
const String kPendingTxt = "Pending";
const String kRejectedTxt = "Rejected";
const String kCancelTxt = "Cancel";
const String kBackTxt = "Back";
const String kConfirmTxt = "Confirm";

const String kConfirmPasswordTxt = "$kConfirmTxt Password";
const String kSignInTxt = "sign in";
const String kSignUpSuccessText = "sign up Success";
const String kPaymentSuccessText = "Payment Submit Successfully ";
const String kSignUpFailedText = "sign up Failed";
const String kSignUpTxt = "sign Up";
const String kLogOutTxt = "logout";
const String kMakeTransferTxt = "Make a Transfer";
const String kInitAccountTxt = "Don't have an account ? ";
const String kForgotPasswordTxt = "Forgot Password ?";
const String kCurrencyExchangeTxt = "Currency exchange";
const String kDoneTransformTxt = "Transform has been done";
const String kPendingTransformTxt = "The transformation is still pending";
const String kCaseTransformTxt = "The transformation is ";
const String kDoneTxt = "Done";
const String kTransformtionTxt = "Transformation";
const String kCheckTxt = "Check";
const String kCompletedTxt = "Completed";
const String kPayUnvMoneyTxt = "Pay University Money";
const String kAccountNumberTxt = "Your Account Number :";
const String kMoneyAmountTxt = "Your Money Amount :";
const String kScreenShotTxt = "Your Transformation ScreenShot";
const kResultsKey = "results";
// error network
const String kNoNetworkTxt = "No Connecting ";
const String kNoServerTxt = "problem inside host";
const String kWrongPwdOrPhoneTxt = "Wrong password or email";
const String kErrorResponseTxt = "Error Response";

// setting
const kProfileTxt = "Profile";
const kChooseCountryTxt = "Choose Your country";
const kLanguageTxt = "Language";
const kContactUsTxt = "Contact us";
const kContactUsDetailsTxt =
    "Please, contact us this transformation need more time";
const kShareAppTxt = "Share App";
const kRateAppTxt = "Rate App";
const kAboutAppTxt = "About App";
const kSaveTxt = "Save";
const kAppliedTxt = "Applied";
const kNextTxt = "Next";
const kFormPayTxt = "Payment Form";
const kPhoneText = "phone";

const kUniversityPayTxt = "Payment University";

const kEgyptTxt = "Egypt";
const kRussiaTxt = "Russia";
const kUaeTxt = "The United Arab Emirates";
const kSaudiArabiaTxt = "Saudi Arabia";
const kArabicTxt = "Arabic";
const kEnglishTxt = "English";

const kAmountOfMoneyTxt = "Amount Of Money";
const kBankAccountNameTxt = "Bank Account Name ";
const kBankAccountNumberTxt = "Bank Account Number ";
const kRussianRubleRateTodayTxt = "Russian ruble rate today";
const kChoosePassportImageTxt = " Choose Your Passport Image";
const kChooseYourIdImageTxt = "Choose Your ID Image";

const kChooseConfirmationMessageImageTxt =
    "Choose Your Confirmation Message Image";
const String kPrizeTitleTxt = "Facilitations for entering the university";
const String kNoServicesListTxt = "The list of services is empty";
const String kNoListTxt = "This list is empty";

// demo data
const kNameDemoText = "Full Name";
const kPhoneDemoText = "+7  9999 99 999 9";
const kEmailDemoText = "*********@gmail.com";
const String kBodyDemoTxt =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
const String kBodyDemoSmallTxt =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley  ";
List<CurrencyModel> currencyDemoList = [
  CurrencyModel(
    name: "EGP",
    country: kEgyptTxt,
    value: "20",
    flagImg: kEgyptFlagImg,
  ),
  CurrencyModel(
      name: "KSA", country: kSaudiArabiaTxt, value: "20", flagImg: kKsaFlagImg),
  CurrencyModel(
    name: "UAE",
    country: kUaeTxt,
    value: "20",
    flagImg: kUaeFlagImg,
  ),
];

const spacing_control_half = 2.0;
const spacing_control = 4.0;
const spacing_standard = 8.0;
const spacing_middle = 10.0;
const spacing_standard_new = 16.0;
const spacing_large = 24.0;
const spacing_xlarge = 32.0;
const spacing_xxLarge = 40.0;

const kEnglishCode = "en";
const kArabicCode = "ar";
