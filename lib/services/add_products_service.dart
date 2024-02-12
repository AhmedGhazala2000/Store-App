import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/products_model.dart';

class AddProductsService {
  Future<ProductModel> addProduct({
    required String title,
    required num price,
    required String description,
    required String image,
    required String category,
    String? token,
  }) async {
    final Dio dio = Dio();
    final Map<String, dynamic> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    try {
      Response response = await dio.post('https://fakestoreapi.com/products',
          data: {
            'title': title,
            'price': price,
            'description': description,
            'image': image,
            'category': category,
          },
          options: Options(
            headers: headers,
          ));
      Map<String, dynamic> product = response.data;
      return ProductModel.fromJson(product);
    } on DioException catch (e) {
      log(e.toString());
      throw Exception(e.response!.data.toString());
    } catch (e) {
      log(e.toString());
      throw Exception(const Text('There was an error, please try later'));
    }
  }
}
