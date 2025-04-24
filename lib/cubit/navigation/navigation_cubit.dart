import '../../../export.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial(0));

  void route(int value) => emit(NavigationInitial(value));
}

class BottomNavigationBarCubit extends Cubit<NavigationVisibility> {
  BottomNavigationBarCubit() : super(NavigationVisibility.visible);

  void updateVisibility(bool isVisible) => emit(
      isVisible ? NavigationVisibility.visible : NavigationVisibility.hidden);
}
