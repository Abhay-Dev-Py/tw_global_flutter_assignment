// class _AppFonts {
//   static const String _baseFontUrl = "assets/google_fonts";

//   ///add app fonts here
//   final String manrope = '$_baseFontUrl/Manrope/Manrope-VariableFont_wght.ttf';
//   final String nunitoBold = '$_baseFontUrl/Nunito-Bold.ttf';
//   final String nunitoRegular = '$_baseFontUrl/Nunito-Regular.ttf';
//   final String nunitoSemiBold = '$_baseFontUrl/Nunito-SemiBold.ttf';
// }

class _AppLottieAnimations {
  static const String _baseAppLottieAnimationsUrl = "assets/lottie_animations";

  ///add app animations here
  final String successTickAnimationJson =
      '$_baseAppLottieAnimationsUrl/success_tick_animation.json';

  final String splashTickAnimationJson =
      '$_baseAppLottieAnimationsUrl/splash_tick_animation.json';
}

class _AppPngs {
  static const String _pngs = "assets/pngs";
  static const String _pngsCommon = "$_pngs/common";
  static const String _pngsDashboard = "$_pngs/dashboard";
  static const String _pngsOnboarding = "$_pngs/onboarding";
  static const String _pngsSignIn = "$_pngs/sign_in";

  /// Common PNG
  final String commonIndianFlag = '$_pngsCommon/indian_flag.png';
  final String commonCancelNumber = '$_pngsCommon/cancel_number.png';
  final String commonPasswordHide = '$_pngsCommon/password_hide.png';
  final String commonPasswordShow = '$_pngsCommon/password_show.png';

  /// Onboarding PNG
  final String onboardingLocation = '$_pngsOnboarding/onboarding_location.png';
  final String onboardingBiometric = '$_pngsOnboarding/biometric.png';

  /// dashboard PNG
  final String dashboardDocument = '$_pngsDashboard/dashboard_document.png';
  final String dashboardDocumentFail = '$_pngsDashboard/document_fail.png';

  /// Sign in PNG
  final String signInPasscodeBanner =
      '$_pngsSignIn/sign_in_passcode_banner.png';
  final String signInAppreciateLogoNameBanner =
      '$_pngsSignIn/sign_in_appreciate_logo_name_banner.png';
}

class _AppSvgs {
  static const String _baseSvgUrl = "assets/svgs";
  static const String _baseCommonUrl = "$_baseSvgUrl/common";

  ///add app svgs here
  final String loginBg = '$_baseSvgUrl/login_bg.svg';
  final String cameraSvg = '$_baseCommonUrl/camera_logo.svg';
  final String selectPhotoSvg = '$_baseCommonUrl/select_photo_logo.svg';
  final String arrowRightSvg = '$_baseCommonUrl/arrow_right.svg';
  final String passwordShowSvg = '$_baseCommonUrl/password_show.svg';
  final String passwordHideSvg = '$_baseCommonUrl/password_hide.svg';
  final String attachmentPinSvg = '$_baseCommonUrl/attachment_pin.svg';
  final String editIconSvg = '$_baseCommonUrl/edit_icon.svg';
}

class AppAssets {
  AppAssets._();

  // Images
  static _AppPngs pngs = _AppPngs();
  // Svgs
  static _AppSvgs svgs = _AppSvgs();
  // Fonts
  // static _AppFonts fonts = _AppFonts();
  // Lottie animations
  static _AppLottieAnimations lottie = _AppLottieAnimations();
}
