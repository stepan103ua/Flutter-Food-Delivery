import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:food_delivery/src/services/responses/error_response.dart';

class ApiError {
  final DioError? dioError;

  ApiError([this.dioError]);

  String get message {
    if(dioError == null) {
      return 'Unknown error occurred';
    }

    log(dioError.toString());

    if(dioError!.response == null) {
      return 'Check your internet connection';
    }

    try{
      log(dioError!.response!.data);
      return ErrorResponse.fromJson(dioError!.response!.data).errorMessage;
    } catch (e) {
      log(e.toString());
      return 'Wrong response from server';
    }
  }
}