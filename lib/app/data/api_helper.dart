import 'package:either_dart/either.dart';
import 'package:get/get.dart';

export 'package:flutter_getx_template/app/common/util/extensions.dart';
export 'package:flutter_getx_template/app/common/util/utils.dart';

abstract class ApiHelper {
  static ApiHelper get to => Get.find();

  Future<Either<Exception, Response>> getRequest(
    String url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
  });

  Future<Either<Exception,Response>> postRequest(
    String? url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    dynamic Function(double)? uploadProgress,
  });

  Future<Either<Exception,Response>> putRequest(
    String url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    dynamic Function(double)? uploadProgress,
  });

  Future<Either<Exception,Response>> deleteRequest(
    String url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
  });
}
