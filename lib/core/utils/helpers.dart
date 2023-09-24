import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:renew_buy/core/utils/exceptions.dart';
import 'package:renew_buy/core/utils/failure.dart';

enum RequestType { get, post, delete }


class Helpers {

  static String convertFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return failure.message;
    }
    return "Unknown error occurred";
  }

  static bool isNetworkError(Failure failure) {
    if (failure is ServerFailure) {
      return failure.message.contains('No Internet Connection');
    }
    return false;
  }


  static Future<Map<String, dynamic>> sendRequest(
      Dio dio, RequestType type, String path,
      {Map<String, dynamic>? queryParams,
        Map<String, dynamic>? headers,
        bool encoded = false,
        dynamic data,
        bool showLoader = true,
        bool isJson = false,
        bool showToast = true}) async {
    debugPrint("$path PayLoad ${queryParams ?? data}");

    final logger = Logger(
      printer: PrettyPrinter(
          methodCount: 2, // number of method calls to be displayed
          errorMethodCount:
          8, // number of method calls if stacktrace is provided
          lineLength: 200, // width of the output
          colors: true, // Colorful log messages
          printEmojis: false, // Print an emoji for each log message
          printTime: false // Should each log print contain a timestamp
      ),
    );
    Map<String, dynamic>? qPara = queryParams ?? {};

    try {
      Response response;

      switch (type) {
        case RequestType.get:
          response = await dio.get(path,
              queryParameters: qPara);
          break;
        case RequestType.post:
          response = (await dio.post(
            path,
            options: Options(

                contentType: isJson
                    ? Headers.jsonContentType
                    : encoded == true
                    ? Headers.formUrlEncodedContentType
                    : null,
                validateStatus: (code) => true),
            queryParameters: qPara,
            data: queryParams ?? FormData.fromMap(data),
          ));
          break;
        case RequestType.delete:
          response = (await dio.delete(path,
            queryParameters: queryParams,
          ));
          break;
        default:
          response = await dio.get(path,
              queryParameters: queryParams);
          debugPrint("Api Method Not Supported");
          break;
      }

      debugPrint("$path response ${response.statusCode} with ${response.statusMessage}");

      if (response.statusCode == 200) {
        logger.d(response.data as Map<String, dynamic>);
        return response.data as Map<String, dynamic>;
      } else if (response.statusCode == 400 || response.statusCode == 202) {
        logger.d(response.data as Map<String, dynamic>);
        throw ServerException(
          message: response.data['message'],
          code: response.statusCode,
        );
      } else {
        throw ServerException(
          message: response.data['message'],
          code: response.statusCode,
        );
      }
    } on ServerException catch (e) {
      throw ServerException(message: e.message, code: e.code);
    } on DioError catch (e) {
      throw ServerException(
          message: e.error is SocketException
              ? 'No Internet Connection'
              : e.error.toString()
      );
    }
  }
}