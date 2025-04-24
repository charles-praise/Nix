import '../../export.dart';
import '../../service/service.dart';

final class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  final AuthLocalService authLocalStorage = AuthLocalService();

  fetchProducts() {
    try {
      final products = authLocalStorage.fetchProducts();
      emit(ProductSuccess(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  void search(String query, List<ProductModel> items) {
    emit(ProductLoading()); // Emit a loading state

    List<ProductModel> filteredItems = items
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    // Emit the filtered results
    if (filteredItems.isNotEmpty) {
      emit(ProductSuccess(filteredItems));
    } else {
      emit(ProductError('Empty List'));
    }
  }
}
