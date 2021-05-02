import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(ScheduleState.initial());
}
