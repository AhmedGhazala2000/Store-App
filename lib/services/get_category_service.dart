import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/products_model.dart';

class CategoryService {
  Future<List<ProductModel>> getCategory(
      {required String categoryName, String? token}) async {
    final Dio dio = Dio();
    final Map<String, dynamic> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    try {
      Response response = await dio
          .get('https://fakestoreapi.com/products/category/$categoryName');
      List<dynamic> products = response.data;
      List<ProductModel> productsList = [];
      for (var i = 0; i < products.length; i++) {
        productsList.add(ProductModel.fromJson(products[i]));
      }
      return productsList;
    } on DioException catch (e) {
      log(e.toString());
      throw Exception(e.response!.data.toString());
    } catch (e) {
      log(e.toString());
      throw Exception(const Text('There was an error, Please try later !'));
    }
  }
}
