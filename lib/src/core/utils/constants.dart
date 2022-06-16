import '../../data/models/currency_model.dart';
import 'images_path.dart';

/// website links
const String kBaseUrl = "https://api.themoviedb.org";
const String kImageUrlSmall = "https://image.tmdb.org/t/p/w200/";

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
const String kCancelTxt = "Cancel";
const String kConfirmTxt = "Confirm";

const String kConfirmPasswordTxt = "$kConfirmTxt Password";
const String kSignInText = "sign in";
const String kSignUpText = "sign Up";
const String kLogOutText = "logout";
const String kMakeTransferText = "Make a Transfer";
const String kInitAccountText = "Don't have an account ? ";
const String kForgotPasswordTxt = "Forgot Password ?";
const String kCurrencyExchangeTxt = "Currency exchange";
const String kDoneTransformTxt = "Transform has been done";
const String kDoneTxt = "Done";
const String kTransformtionTxt = "Transformation";
const String kCheckTxt = "Check";
const String kCompletedTxt = "Completed";
const String kPayUnvMoneyTxt = "Pay University Money";
const String kAccountNumberTxt = "Your Account Number :";
const String kMoneyAmountTxt = "Your Money Amount :";
const String kScreenShotTxt = "Your Transformation ScreenShot";

const String kPeopleTxt = "People";
const String kGenderTxt = "Gender";
const String kPopularityTxt = "Popularity";
const String kMaleTxt = "♂︎";
const String kFemaleTxt = "♀︎";

const String kDetailsTxt = "Details";
const String kPosterTxt = "Poster";
const String kDetailsAPI =
    "Displaying a list of popular people (actors, directors ..etc)";

const spacing_control_half = 2.0;
const spacing_control = 4.0;
const spacing_standard = 8.0;
const spacing_middle = 10.0;
const spacing_standard_new = 16.0;
const spacing_large = 24.0;
const spacing_xlarge = 32.0;
const spacing_xxLarge = 40.0;

const kLazyScrollKey = "LazyScrollHomeKey";
const kResultsKey = "results";

// setting
const kProfileText = "Profile";
const kChooseCountryText = "Choose Your country";
const kLanguageText = "Language";
const kContactUsText = "Contact us";
const kShareAppText = "Share App";
const kRateAppText = "Rate App";
const kAboutAppText = "About App";
const kSaveText = "Save";
const kAppliedText = "Applied";
const kNextText = "Next";
const kFormPayText = "Payment Form";
const kUniversityPayText = "Payment University";
const kNameDemoText = "Full Name";
const kPhoneDemoText = "+7  9999 99 999 9";
const kEmailDemoText = "*********@gmail.com";
const kEgyptText = "Egypt";
const kUaeText = "The United Arab Emirates";
const kSaudiArabiaText = "Saudi Arabia";
const kAmountOfMoneyText = "Amount Of Money";
const kBankAccountNameText = "Bank Account Name ";
const kBankAccountNumberText = "Bank Account Number ";
const kRussianRubleRateTodayText = "Russian ruble rate today";
const kChoosePassportImageText = " Choose Your Passport Image";
const kChooseYourIdImageText = "Choose Your ID Image";

const kChooseConfirmationMessageImageText =
    "Choose Your Confirmation Message Image";

// demo data
const String kPrizeTitleTxt = "Facilitations for entering the university";
const String kBodyDemoTxt =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
const String kBodyDemoSmallTxt =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley  ";
List<CurrencyModel> currencyDemoList = [
  CurrencyModel(
    name: "EGP",
    country: kEgyptText,
    value: "20",
    flagImg: kEgyptFlagImg,
  ),
  CurrencyModel(
      name: "KSA",
      country: kSaudiArabiaText,
      value: "20",
      flagImg: kKsaFlagImg),
  CurrencyModel(
    name: "UAE",
    country: kUaeText,
    value: "20",
    flagImg: kUaeFlagImg,
  ),
];
