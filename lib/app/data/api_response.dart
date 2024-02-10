import 'dart:async';
import 'dart:convert';

import 'package:flutter_getx_template/app/common/models/api_success_model.dart';
import 'package:flutter_getx_template/app/common/values/strings.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import 'errors/api_error.dart';

abstract class ApiResponse {
  static T? _parseResponse<T>(Response<T> response) {
    final status = response.status;

    if (status.connectionError) {
      throw const ApiError(
        type: ErrorType.noConnection,
        error: Strings.noConnection,
      );
    }

    if (response.bodyString == null) throw const ApiError();

    try {
      String result = response.bodyString!;
      final res = jsonDecode(result);

      if (response.isOk) {
        if (res is Map) {
          if (res["status"] != null &&
              !res["status"] &&
              res['error_status'] != null &&
              res['error_status'] != null &&
              res['error_code'].toString().isNotEmpty) {
            // TODO map the error code accordingly
            if (res['error_code'].toString() == 'invalidtoken') {
              throw const ApiError(
                type: ErrorType.response,
                error: Strings.unauthorize,
              );
            } else {
              throw ApiError(
                type: ErrorType.response,
                error: res['message']?.toString() ??
                    (res['message']?.toString() ?? Strings.unknownError),
              );
            }
          }
        }

        return response.body;
      } else {
        if (status.isServerError) {
          throw const ApiError();
        } else if (status.code == HttpStatus.requestTimeout) {
          throw const ApiError(
            type: ErrorType.connectTimeout,
            error: Strings.connectionTimeout,
          );
        } else if (response.unauthorized) {
          throw ApiError(
            type: ErrorType.unauthorize,
            error: res['msg']?.toString() ?? Strings.unauthorize,
          );
        } else {
          throw ApiError(
            type: ErrorType.response,
            error: res['msg']?.toString() ?? Strings.unknownError,
          );
        }
      }
    } on FormatException {
      throw const ApiError(
        type: ErrorType.unknownError,
        error: Strings.unknownError,
      );
    } on TimeoutException catch (e) {
      throw ApiError(
        type: ErrorType.connectTimeout,
        error: e.message?.toString() ?? Strings.connectionTimeout,
      );
    }
  }

  static ApiSuccessResponseModel getApiResponse(Response response) {
    try {
      return ApiSuccessResponseModel.fromJson(_parseResponse(response));
    } catch (e) {
      rethrow;
    }
  }
}
