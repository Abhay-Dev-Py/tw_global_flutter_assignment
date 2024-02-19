abstract class Constants {
  // static const String baseUrl = String.fromEnvironment('B');
  static const String baseUrl =
      "https://appreciate-otp-module-dev.pacewisdom.in/v2";

  static const timeout = Duration(seconds: 5);
  static const String token = 'authToken';

  static const String dummyImageUrl =
      'https://i.picsum.photos/id/1084/536/354.jpg'
      '?grayscale&hmac=Ux7nzg19e1q35mlUVZjhCLxqkR30cC-CarVg-nlIf60';
  static const String placeHolderBlurHash = 'LEHV6nWB2yk8pyo0adR*.7kCMdnj';

  static const int otpResendSeconds = 120;
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
  pincode,
  iibf_registration_number,
  serial_number,
  date_of_certificate_issue,
  iibf_certificate_photo,
}

enum AgentOnboardingStatus {
  upload_iibf_certificate,
  admin_to_be_assigned,
  admin_assigned,
  verification_started,
  verification_completed,
}

enum AdminSelectedTab {
  pending,
  in_progress,
  verififed,
}

enum AgentVerificationStatus {
  view_details,
  start_verification,
}

enum AgentVerificationFlowStep {
  pan_verification,
  details_confirmation,
  shop_verification,
  selfie_verification,
  mobile_verification,
  biometric,
}

enum PanErrorCodes {
  unable_to_read_pan_data,
  invalid_pan_number,
  pan_mismatch,
  pan_upload_error,
  kyc_processing_error,
  pan_aadhar_not_linked,
  pan_upload_restricted,
  you_can_not_proceed,
}

enum ReviewAgentDetails {
  full_name,
  pan_number,
  dob,
  mobile_number,
  email,
  shop_name,
  shop_address,
  city,
  state,
  country,
  pincode,
}

enum BiometricSteps {
  device_connected_status,
  battery_status,
  rd_service_app_status,
}
