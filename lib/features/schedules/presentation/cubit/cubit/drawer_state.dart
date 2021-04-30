part of 'drawer_cubit.dart';

class DrawerState {
  final int selectedIndex;

  DrawerState({@required this.selectedIndex});

  factory DrawerState.initial() => DrawerState(selectedIndex: 0);

  DrawerState copyWith({
    int selectedIndex,
  }) =>
      DrawerState(
        selectedIndex: selectedIndex ?? this.selectedIndex,
      );
}
