import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/get_category_service.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  getProductsCategory({required String categoryName}) async {
    emit(ProductsLoading());
    try {
      List<ProductModel> products =
          await CategoryService().getCategory(categoryName: categoryName);
      emit(ProductsSuccess(products: products));
    } catch (e) {
      emit(ProductsFailure(errMessage: e.toString()));
    }
  }
}
