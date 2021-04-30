import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerState.initial());

  void emitState({@required DrawerState state}) {
    emit(state);
  }

  void changeSelection({@required int selectedItem}) {
    emit(state.copyWith(selectedIndex: selectedItem));
  }
}
