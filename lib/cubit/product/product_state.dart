import '../../export.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSuccess extends ProductState {
  final List<ProductModel> product;
  ProductSuccess(this.product);
}

final class ProductError extends ProductState {
  final String error;
  ProductError(this.error);
}
