class _AppFonts {
  static const String _baseFontUrl = "assets/fonts";

  ///add app fonts here
  final String nunitoBold = '$_baseFontUrl/Nunito-Bold.ttf';
  final String nunitoRegular = '$_baseFontUrl/Nunito-Regular.ttf';
  final String nunitoSemiBold = '$_baseFontUrl/Nunito-SemiBold.ttf';
}

class _AppImages {
  static const String _baseImageUrl = "assets/images";

  ///add app images here
  final String icGallery = '$_baseImageUrl/ic_gallery.png';
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
