sealed class NavigationState {}

enum NavigationVisibility { visible, hidden }

final class NavigationInitial extends NavigationState {
  final int index;
  NavigationInitial(this.index);
}
