import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../../../../../../errors/api_error.dart';
import 'responses/categories_response.dart';

class CategoriesService {
  final Dio _dio;

  CategoriesService({required Dio dio}) : _dio = dio;

  Future<CategoriesResponse> getCategories() async {
    try {
      final response = await _dio.get('/categories');
      return CategoriesResponse.fromJson(response.data);
    } on DioError catch (error) {
      return Future.error(error);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<CategoriesResponse> getCategoriesByQuery(String query) async {
    try {
      final response =
          await _dio.get('/categories', queryParameters: {'query': query});
      return CategoriesResponse.fromJson(response.data);
    } on DioError catch (error) {
      return Future.error(ApiError(error));
    } catch (e) {
      log(e.toString(), name: e.runtimeType.toString());
      return Future.error(e);
    }
  }
}
