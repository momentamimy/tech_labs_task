import 'dart:convert';
import 'package:dio/dio.dart';

import '../constants/text_constants.dart';

class ExceptionHelper {
  static String exceptionMessage(Object ex) {
    if (ex is DioException) {
      // Response from the server
      if (ex.response != null && ex.response.toString().isNotEmpty) {
        var jsonResponse = jsonDecode(ex.response.toString());
        String? backendMessage = _checkBackendMessage(jsonResponse);
        if (backendMessage != null) return backendMessage;
      }
      // Dio Exceptions
      else {
        String? dioMessage = _checkDioMessage(ex);
        if (dioMessage != null) {
          return dioMessage;
        }
      }
    }
    return "something_went_wrong";
  }

  static String? _checkBackendMessage(var jsonResponse) {
    // Errors list
    String? error = jsonResponse["error"];
    if (error != null) {
      return error;
    }
    return null;
  }

  static String? _checkDioMessage(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        break;
      case DioExceptionType.sendTimeout:
        break;
      case DioExceptionType.receiveTimeout:
        break;
      case DioExceptionType.badCertificate:
        break;
      case DioExceptionType.badResponse:
        if (dioException.response?.statusCode == 401) {
          return TextConst.authErrorMessage;
        }
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.connectionError:
        return TextConst.networkErrorMessage;
      case DioExceptionType.unknown:
        return TextConst.unknownErrorMessage;
      default:
        return null;
    }
    return null;
  }
}
