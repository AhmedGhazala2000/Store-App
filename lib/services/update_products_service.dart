import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/products_model.dart';

class UpdateProductsService {
  Future<ProductModel> updateProduct({
    required int id,
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
    log('id=$id title=$title price=$price image=$image');
    try {
      Response response = await dio.put(
        'https://fakestoreapi.com/products/$id',
        data: {
          'title': title,
          'price': price,
          'description': description,
          'image': image,
          'category': category,
        },
        options: Options(
          headers: headers,
        ),
      );
      Map<String, dynamic> product = response.data;
      log(product.toString());
      return ProductModel.fromJson(product);
    } on DioException catch (e) {
      log(e.toString());
      throw Exception(e.response!.data.toString());
    } catch (e) {
      log(e.toString());
      throw Exception(const Text('there was an error, try later'));
    }
  }
}
