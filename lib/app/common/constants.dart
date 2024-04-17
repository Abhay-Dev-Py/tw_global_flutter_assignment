abstract class Constants {
  // static const String baseUrl = String.fromEnvironment('B');
  static const String baseUrl = "https://pixabay.com/api/";

  static const String apiKey = "43433500-280de6c2af20a7c8e7d697580";

  static const timeout = Duration(seconds: 5);
  static const String token = 'authToken';

  static const String dummyImageUrl =
      'https://i.picsum.photos/id/1084/536/354.jpg'
      '?grayscale&hmac=Ux7nzg19e1q35mlUVZjhCLxqkR30cC-CarVg-nlIf60';
  static const String placeHolderBlurHash = 'LEHV6nWB2yk8pyo0adR*.7kCMdnj';

  static const int otpResendSeconds = 120;
}
