abstract class Constants {
  static const String baseUrl = String.fromEnvironment('B');

  static const timeout = Duration(seconds: 5);
  static const String token = 'authToken';

  static const String dummyImageUrl =
      'https://i.picsum.photos/id/1084/536/354.jpg'
      '?grayscale&hmac=Ux7nzg19e1q35mlUVZjhCLxqkR30cC-CarVg-nlIf60';
  static const String placeHolderBlurHash = 'LEHV6nWB2yk8pyo0adR*.7kCMdnj';
}

enum Role { agent, admin }

enum TextFeildType { mobile, password, text }

enum AuthType { mobile, email }

enum ForgotPasswordType { mobile, email }

enum ReviewDetails {
  full_name,
  dob,
  email,
  mobile_number,
  pan_number,
  shop_name,
  shop_address,
  city,
  state,
  country,
  iibf_registration_number,
  serial_number,
  date_of_certificate_issue,
  iibf_certificate_photo,
}
