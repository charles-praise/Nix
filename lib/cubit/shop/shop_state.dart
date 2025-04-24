part of 'shop_cubit.dart';

sealed class ShopState extends Equatable {
  const ShopState();

  @override
  List<Object> get props => [];
}

// Banner
final class ShopInitial extends ShopState {}

final class ShopLoading extends ShopState {}

final class ShopSuccess extends ShopState {
  final List? item;
  const ShopSuccess(this.item);
}

final class ShopError extends ShopState {
  final String error;
  const ShopError(this.error);
}

final class ShopActiveIndex extends ShopState {
  final int index;
  const ShopActiveIndex({this.index = 0});
}

//  Search
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchResults extends SearchState {
  final List<ProductModel> results;

  SearchResults(this.results);
}

class SearchError extends SearchState {
  final String error;
  SearchError(this.error);
}
