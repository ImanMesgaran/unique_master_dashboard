part of 'schedule_cubit.dart';

class ScheduleState {
  final ScheduleViewType scheduleViewType;
  ScheduleState({@required this.scheduleViewType});

  factory ScheduleState.initial() => ScheduleState(
        scheduleViewType: ScheduleViewType.Day,
      );
}

enum ScheduleViewType { Day, Week }
