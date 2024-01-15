class _AppFonts {
  static const String _baseFontUrl = "assets/google_fonts";

  ///add app fonts here
  final String manrope ='$_baseFontUrl/Manrope/Manrope-VariableFont_wght.ttf';
  final String nunitoBold = '$_baseFontUrl/Nunito-Bold.ttf';
  final String nunitoRegular = '$_baseFontUrl/Nunito-Regular.ttf';
  final String nunitoSemiBold = '$_baseFontUrl/Nunito-SemiBold.ttf';
}

class _AppImages {
  static const String _baseImageUrl = "assets/images";

  ///add app images here
  final String icGallery = '$_baseImageUrl/ic_gallery.png';
  final String onboardingLocation = '$_baseImageUrl/onboarding_location.png';
  final String biometric = '$_baseImageUrl/biometric.png';
}

class _AppSvgs {
  static const String _baseSvgUrl = "assets/svgs";

  ///add app svgs here
  final String loginBg = '$_baseSvgUrl/login_bg.svg';
}

class AppAssets {
  AppAssets._();

  // Images
  static _AppImages images = _AppImages();
  // Svgs
  static _AppSvgs svgs = _AppSvgs();
  // Fonts
  static _AppFonts fonts = _AppFonts();
}
