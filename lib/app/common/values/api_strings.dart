class ApiRoutes {
  ApiRoutes._();

  static const String _baseUrl =
      "https://appreciate-otp-module-dev.pacewisdom.in/v2";

  // create your routes here below
  static const sendOtp = _baseUrl + "/send_otp/";
  static const verifyOtp = _baseUrl + "/verify_otp/";
  static const resendOtp = _baseUrl + "/resend_otp/";
}
