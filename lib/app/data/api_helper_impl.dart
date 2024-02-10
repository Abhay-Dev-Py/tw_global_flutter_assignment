import 'dart:async';
import 'dart:convert';
import 'dart:io';


import 'package:either_dart/either.dart';
import 'package:flutter_getx_template/app/common/constants.dart';
import 'package:flutter_getx_template/app/common/storage/storage.dart';

import 'package:get/get.dart';

import 'api_helper.dart';


class ApiHelperImpl extends GetConnect with ApiHelper {
  

  @override
  void onInit() {
    httpClient.baseUrl = Constants.baseUrl;
    httpClient.timeout = Constants.timeout;

    requestInterceptor();

    responseInterceptor();
  }

  void responseInterceptor() {
    httpClient.addResponseModifier((request, response) {
      printInfo(
        info: 'Status Code: ${response.statusCode}\n'
            'Data: ${response.bodyString?.toString() ?? ''}',
      );

      return response;
    });
  }

  void requestInterceptor() {
    httpClient.addRequestModifier<dynamic>((request) {
      if (Storage.hasData(Constants.token)) {
        request.headers['Authorization'] = Storage.getValue(Constants.token);
      }

      printInfo(
        info: 'REQUEST ║ ${request.method.toUpperCase()}\n'
            'url: ${request.url}\n'
            'Headers: ${request.headers}\n'
            'Body: ${request.files?.toString() ?? ''}\n',
      );

      return request;
    });
  }

  @override
  Future<Either<Exception, Response>> getRequest(
    String url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
  }) async {
    try {
      return Right(
        await get(
          url,
          headers: headers,
          contentType: contentType,
          query: query,
        ),
      );
    } on HttpException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Exception("Expection ${e.toString()}"));
    }
  }

  @override
  Future<Either<Exception, Response>> postRequest(
    String? url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    dynamic Function(double)? uploadProgress,
  }) async {
    try {
      
      return Right(
        await post(
          url,
          json.encode(body),
          contentType: contentType,
          headers: headers,
          query: query,
          uploadProgress: uploadProgress,
        ),
      );
    } on HttpException catch (e) {
      return Left(e);
    } on Exception catch (e) {
      return Left(Exception("Expection ${e.toString()}"));
    }
  }

  @override
  Future<Either<Exception, Response>> putRequest(
    String url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    dynamic Function(double)? uploadProgress,
  }) async {
    try {
      return Right(
        await put(
          url,
          body,
          contentType: contentType,
          headers: headers,
          query: query,
          uploadProgress: uploadProgress,
        ),
      );
    } on HttpException catch (e) {
      return Left(e);
    } on Exception catch (e) {
      return Left(Exception("Expection ${e.toString()}"));
    }
  }

  @override
  Future<Either<Exception, Response>> deleteRequest(
    String url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
  }) async {
    try {
      return Right(
        await delete(
          url,
          headers: headers,
          contentType: contentType,
          query: query,
        ),
      );
    } on HttpException catch (e) {
      return Left(e);
    } on Exception catch (e) {
      return Left(Exception("Expection ${e.toString()}"));
    }
  }
}
