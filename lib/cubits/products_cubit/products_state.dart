part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsSuccess extends ProductsState {
  final List<ProductModel> products;

  ProductsSuccess({required this.products});
}

class ProductsFailure extends ProductsState {
  final String? errMessage;

  ProductsFailure({@required this.errMessage});
}
