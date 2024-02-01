import 'package:either_dart/either.dart';
import 'package:flutter_getx_template/app/common/values/api_strings.dart';
import 'package:flutter_getx_template/app/data/api_helper_impl.dart';
import 'package:flutter_getx_template/app/data/api_response.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class OnboardingServices {
  final ApiHelperImpl _serviceLayer = ApiHelperImpl();
  // Mobile Number View services -- Start

  Future sendMobileOtp({required String mobileNumber}) async {
    Map<String, String> body = {
      "request_purpose": "registration",
      "mobile_number": mobileNumber,
    };

    Either<Exception, Response<dynamic>> result =
        await _serviceLayer.postRequest(
      ApiRoutes.sendOtp,
      body,
      headers: {'Accept': '*/*', 'Content-Type': 'application/json'},
    );

    if (result.isRight) {
      dynamic res = ApiResponse.getResponse(result.right);
      print(res);
    }
  }

  // Mobile Number View services -- End
}
