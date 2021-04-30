import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerState.initial());

  void changeSelection({@required int selectedItem}) {
    emit(state.copyWith(selectedIndex: selectedItem));
  }
}
