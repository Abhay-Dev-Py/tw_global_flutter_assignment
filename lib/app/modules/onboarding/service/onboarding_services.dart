import 'package:either_dart/either.dart';
import 'package:flutter_getx_template/app/common/models/api_success_model.dart';
import 'package:flutter_getx_template/app/common/util/utils.dart';
import 'package:flutter_getx_template/app/common/values/api_strings.dart';
import 'package:flutter_getx_template/app/data/api_helper_impl.dart';
import 'package:flutter_getx_template/app/data/api_response.dart';
import 'package:flutter_getx_template/app/data/errors/api_error.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class OnboardingServices {
  final ApiHelperImpl _serviceLayer = ApiHelperImpl();
  // Mobile Number View services -- Start

  String? mobileOtpRequestId;

  Future<bool> sendMobileOtp({required String mobileNumber}) async {
    Map<String, String> body = {
      "request_purpose": "registration",
      "mobile_number": mobileNumber,
    };

    Either<Exception, Response<dynamic>> result =
        await _serviceLayer.postRequest(
      ApiRoutes.sendOtp,
      body,
    );

    if (result.isRight) {
      try {
        ApiSuccessResponseModel response =
            ApiResponse.getApiResponse(result.right);
        if (response.status && response.data?["request_id"]?.isNotEmpty) {
          mobileOtpRequestId = response.data?["request_id"];
          Utils.showSnackbar(response.message);
          return true;
        }
      } on Exception catch (_) {
        // Handle exception e
        return false;
      }
    }
    return false;
  }

  Future<bool> verifyMobileOtp({
    required String otp,
    bool isResendOtp = false,
  }) async {
    if (mobileOtpRequestId != null) {
      Map<String, String> body = {
        "request_id": mobileOtpRequestId!,
        "otp": otp,
      };

      Either<Exception, Response<dynamic>> result =
          await _serviceLayer.postRequest(
        isResendOtp ? ApiRoutes.resendOtp : ApiRoutes.verifyOtp,
        body,
      );

      if (result.isRight) {
        try {
          ApiSuccessResponseModel response =
              ApiResponse.getApiResponse(result.right);
          Utils.showSnackbar(response.message);
          return response.status;
        } on ApiError catch (error) {
          Utils.showSnackbar(error.message);
        }
      }
    }
    return false;
  }

  // Mobile Number View services -- End
}
