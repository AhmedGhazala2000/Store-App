import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AllCategoriesService {
  Future<List> getAllCategories({String? token}) async {
    final Dio dio = Dio();
    final Map<String, dynamic> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    try {
      Response response =
          await dio.get('https://fakestoreapi.com/products/categories',
              options: Options(
                headers: headers,
              ));
      List<dynamic> products = response.data;
      return products;
    } on DioException catch (e) {
      log(e.toString());
      throw Exception(e.response!.data.toString());
    } catch (e) {
      log(e.toString());
      throw Exception(const Text('There was an error, Please try later !'));
    }
  }
}
