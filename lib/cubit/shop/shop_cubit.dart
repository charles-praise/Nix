import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:shoplax_by_charles/export.dart';
import 'package:shoplax_by_charles/service/service.dart';

part 'shop_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void search(String query, List<ProductModel> items) {
    emit(SearchLoading()); // Emit a loading state

    List<ProductModel> filteredItems = items
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    // Emit the filtered results
    if (filteredItems.isNotEmpty) {
      emit(SearchResults(filteredItems));
    } else {
      emit(SearchError('Empty'));
    }
  }
}

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());
  Timer? timer;
  final AuthLocalService authLocalStorage = AuthLocalService();

  void activeIndex(value) => emit(ShopActiveIndex(index: value));

  List<String> getCategoryImages() {
    emit(ShopLoading());
    try {
      final categoryImages = authLocalStorage.getCategoryImages();
      emit(ShopSuccess(categoryImages));
    } catch (e) {
      emit(ShopError(e.toString()));
    }
    return [''];
  }

  List<Widget> getBannerList() {
    final imageList = authLocalStorage.fetchBannerImage();
    return List.generate(
      imageList.length,
      (index) => Image.asset(imageList[index], fit: BoxFit.fill),
    );
  }

  void startTimer(PageController pagecontroller) {
    final imageList = authLocalStorage.fetchBannerImage();
    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (pageController.page == imageList.length - 1) {
        pageController.animateToPage(0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      } else {
        pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      }
      return;
    });
  }
}
