import 'package:shoplax_by_charles/service/service.dart';

import '../export.dart';

final getIt = GetIt.instance;
void setupLocator() {
//   Register any service, repository or Cubits here
  getIt.registerSingleton<NavigationCubit>(NavigationCubit());
  getIt.registerSingleton<BottomNavigationBarCubit>(BottomNavigationBarCubit());
  getIt.registerSingleton<ShopCubit>(ShopCubit()..getBannerList());
  getIt.registerSingleton<AuthLocalService>(AuthLocalService());
  getIt.registerSingleton<SearchCubit>(SearchCubit());
  getIt.registerSingleton<ProductCubit>(ProductCubit()..fetchProducts());
  getIt.registerSingleton<AuthCubit>(AuthCubit());
}
