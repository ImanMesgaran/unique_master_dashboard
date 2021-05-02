import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unique_master_dashboard/core/global/colors_web.dart';
import 'package:unique_master_dashboard/core/global/text_styles.dart';
import 'package:unique_master_dashboard/features/schedules/domain/entity/course_mode.dart';
import 'package:unique_master_dashboard/features/schedules/presentation/cubit/schedule_cubit/schedule_cubit.dart';

class DailyTimeline extends StatefulWidget {
  DailyTimeline({Key key}) : super(key: key);

  @override
  _DailyTimelineState createState() => _DailyTimelineState();
}

class _DailyTimelineState extends State<DailyTimeline> {
  ScheduleCubit _scheduleCubit = ScheduleCubit();

  var _width;
  var _height;

  final _rowHeight = 80.0;
  final _durationConst = 1.5;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        print('*************** ${constraints.minWidth} ***************');
        print('*************** ${constraints.maxWidth} ***************');

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            //_headerTile(),
            //Divider(color: app_gray_four_color, height: 0),
            _footerTile(
              //height: constraints.maxHeight,
              height: _rowHeight * 27,
              width: constraints.maxWidth,
            ),
          ],
        );
      },
    );
  }

  _headerTile(ScheduleState state) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("GMT +3:30",
              style: gray__16__400.copyWith(
                color: app_gray_three_color,
              )),
          Icon(Icons.keyboard_arrow_down_rounded, color: app_gray_three_color),
          SizedBox(width: 40),
          if (state.scheduleViewType == ScheduleViewType.Day)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: app_light_purple_two_color,
              ),
              height: 45,
              width: 45,
              child: Text(
                '11\nJan',
                textAlign: TextAlign.center,
                style: black__18__600.copyWith(
                    color: app_white_color, fontSize: 14),
              ),
            ),
          if (state.scheduleViewType == ScheduleViewType.Week)
            Container(height: 15, width: 15, color: Colors.green)
        ],
      ),
    );
  }

  _footerTile({double height, double width}) {
    return BlocConsumer<ScheduleCubit, ScheduleState>(
      bloc: _scheduleCubit,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          width: width,
          height: height,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Vertical divider
              _buildMainVerticalDivider(),
              // Horizontal divider
              _buildMainHorizontalDivider(width: width),
              // Table Header
              _buildTableHeader(state),
              // repeated Vertical Dividers
              _buildRepeatedVerticalDividers(width: width),
              if (state.scheduleViewType == ScheduleViewType.Day)
                _buildCourseLayoutDay(width: width),
              if (state.scheduleViewType == ScheduleViewType.Week)
                Container(height: 15, width: 15, color: Colors.green)
            ],
          ),
        );
      },
    );
  }

  _buildMainVerticalDivider() {
    return Positioned(
      top: 0,
      bottom: 0,
      left: 120,
      child: Container(
        width: 1,
        color: app_gray_four_color,
      ),
    );
  }

  _buildMainHorizontalDivider({@required double width}) {
    return Positioned(
      top: _rowHeight,
      left: 0,
      child: Container(
        height: 1,
        width: width,
        color: app_gray_four_color,
      ),
    );
  }

  _buildTableHeader(ScheduleState state) {
    return Positioned(
      top: 10,
      left: 15,
      child: _headerTile(state),
    );
  }

  _buildRepeatedVerticalDividers({@required double width}) {
    return Stack(
      alignment: Alignment.topLeft,
      children: List.generate(
        27,
        (index) {
          if (index <= 1) return Container();

          return Positioned(
            top: _rowHeight * index,
            left: 0,
            child: Row(
              children: [
                SizedBox(width: 40),
                Text(
                  index <= 11 ? "0${index - 2}:00" : "00:${index - 2}",
                  style: gray__14__500,
                ),
                SizedBox(width: 25),
                Container(
                  height: 1,
                  width: width,
                  color: app_gray_four_color,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _buildCourseLayoutDay({double width}) {
    return Stack(
        children: _mockCourses.map((e) {
      final _index = e.id + 2;
      return Positioned(
        top: (_rowHeight * _index) + ((e.id % 1) == 0 ? 10 : 0),
        left: 135,
        right: 15,
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: e.tileColor,
            ),
            alignment: Alignment.center,
            width: width,
            height: (_rowHeight * _durationConst) - 10,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 20),
                  Image.asset(
                    e.icon,
                    width: 80,
                    height: 80,
                    alignment: Alignment.center,
                  ),
                  SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              e.courseTitle,
                              style: gray__16__600.copyWith(
                                  color: app_black_color),
                            ),
                          ),
                          SizedBox(width: 15),
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              e.courseType,
                              style: gray__16__600.copyWith(
                                  color: e.iconBackgroundColor),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Text(
                        e.time,
                        style: gray__14__500,
                      ),
                      // ElevatedButton(
                      //   child: Text('click!'),
                      //   onPressed: () {},
                      // ),
                    ],
                  ),
                  SizedBox(width: 25),
                ],
              ),
            ),
          ),
        ),
      );
    }).toList());
  }

  final _mockCourses = [
    CourseModel(
      id: 1,
      courseTitle: "Programming Basics",
      courseType: "Webinar Course",
      time: "01:00 - 02:30",
      icon: "assets/icons/webinar_icon.png",
      iconBackgroundColor: app_green_color,
      tileColor: app_green_two_color,
      buttonTitle: "Join Webinar",
    ),
    CourseModel(
      id: 3.5,
      courseTitle: "Programming Basics",
      courseType: "Video Course",
      time: "01:00 - 02:30",
      icon: "assets/icons/video_course_icon.png",
      iconBackgroundColor: app_orange_color,
      tileColor: app_orange_two_color,
      buttonTitle: "Join Webinar",
    ),
    CourseModel(
      id: 5,
      courseTitle: "Programming Basics",
      courseType: "One-to-One Class",
      time: "01:00 - 02:30",
      icon: "assets/icons/one_to_one_icon.png",
      iconBackgroundColor: app_red_two_color,
      tileColor: app_red_three_color,
      buttonTitle: "Join Webinar",
    ),
    CourseModel(
      id: 8,
      courseTitle: "Programming Basics",
      courseType: "Webinar Course",
      time: "01:00 - 02:30",
      icon: "assets/icons/home_work_icon.png",
      iconBackgroundColor: app_blue_two_color,
      tileColor: app_blue_three_color,
      buttonTitle: "Join Webinar",
    ),
    CourseModel(
      id: 10,
      courseTitle: "Programming Basics",
      courseType: "Webinar Course",
      time: "01:00 - 02:30",
      icon: "assets/icons/quiz_icon.png",
      iconBackgroundColor: app_light_purple_two_color,
      tileColor: app_light_purple_one_color,
      buttonTitle: "Join Webinar",
    ),
  ];
}
