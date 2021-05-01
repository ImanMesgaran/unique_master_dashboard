import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:timelines/timelines.dart';
import 'package:unique_master_dashboard/core/global/colors_web.dart';
import 'package:unique_master_dashboard/core/global/text_styles.dart';
import 'package:unique_master_dashboard/features/schedules/presentation/cubit/cubit/drawer_cubit.dart';
import 'package:unique_master_dashboard/features/schedules/presentation/widgets/app_scaffold/app_scaffold.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:unique_master_dashboard/features/schedules/presentation/widgets/list_tiles/upcoming_plans_tile.dart';
import 'package:unique_master_dashboard/services/navigation/navigation_service_interface.dart';
import '../../../../../injection_container.dart' as di;

class SchedulesPageRoute extends StatefulWidget {
  SchedulesPageRoute({Key key}) : super(key: key);

  @override
  _SchedulesPageRouteState createState() => _SchedulesPageRouteState();
}

class _SchedulesPageRouteState extends State<SchedulesPageRoute> {
  //final _drawerCubit = di.getIt<DrawerCubit>();
  final _navigator = di.getIt<INavigationService>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      selectedItem: 3,
      pageTitle: "home_page.title".tr(),
      body: Row(
        children: [
          _mainView(),
          _sideView(),
        ],
      ),
    );
  }

  _mainView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 36),
      width: MediaQuery.of(context).size.width / 2,
      height: double.infinity,
      color: app_background_color,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: app_white_color,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 37),
                  Text(
                    'schedule_page.calendar_header'.tr(),
                    style: black__18__600,
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Text(
                    'schedule_page.day_title'.tr(),
                    style: gray__18__400,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: app_gray_three_color,
                  ),
                  SizedBox(width: 41),
                ],
              ),
              SizedBox(height: 5),
              Divider(color: app_gray_four_color),
              SizedBox(height: 5),
              Container(
                alignment: Alignment.centerLeft,
                color: Colors.grey,
                child: FixedTimeline.tileBuilder(
                  builder: TimelineTileBuilder.connectedFromStyle(
                    contentsAlign: ContentsAlign.basic,
                    oppositeContentsBuilder: (context, index) => Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 60.0,
                        vertical: 15,
                      ),
                      child: Text('opposite\ncontents'),
                    ),
                    contentsBuilder: (context, index) => Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 60.0,
                          vertical: 15,
                        ),
                        child: Text('Contents')),
                    connectorStyleBuilder: (context, index) =>
                        ConnectorStyle.solidLine,
                    indicatorStyleBuilder: (context, index) =>
                        IndicatorStyle.dot,
                    itemCount: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _sideView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 36),
      width: MediaQuery.of(context).size.width / 3.9,
      height: double.infinity,
      color: app_gray_five_color,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: app_white_color,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 37),
                  Text(
                    'schedule_page.calendar_title'.tr(),
                    style: black__18__600,
                  ),
                ],
              ),
              SizedBox(height: 5),
              Divider(color: app_gray_four_color),
              //SizedBox(height: 20),
              _calendarView(),
              SizedBox(height: 20),
              Divider(color: app_gray_four_color),
              _upCommingPlansWidget(),
            ],
          ),
        ),
      ),
    );
  }

  DateTime _currentDate;

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2021, 5, 1): [
        new Event(
          date: new DateTime(2021, 5, 1),
          title: 'Event 1',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.red,
            height: 5.0,
            width: 5.0,
          ),
        ),
        new Event(
          date: new DateTime(2019, 2, 10),
          title: 'Event 2',
          icon: _eventIcon,
        ),
        new Event(
          date: new DateTime(2019, 2, 10),
          title: 'Event 3',
          icon: _eventIcon,
        ),
      ],
    },
  );

  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: new Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  _calendarView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: CalendarCarousel<Event>(
        onDayPressed: (DateTime date, List<Event> events) {
          this.setState(() => _currentDate = date);
        },
        /*weekendTextStyle: TextStyle(
                        color: app_light_purple_two_color,
                      ),*/
        //thisMonthDayBorderColor: Colors.grey,
        //      weekDays: null, /// for pass null when you do not want to render weekDays
        //      headerText: Container( /// Example for rendering custom header
        //        child: Text('Custom Header'),
        //      ),
        customDayBuilder: (
          /// you can provide your own build function to make custom day containers
          bool isSelectable,
          int index,
          bool isSelectedDay,
          bool isToday,
          bool isPrevMonthDay,
          TextStyle textStyle,
          bool isNextMonthDay,
          bool isThisMonthDay,
          DateTime day,
        ) {
          /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
          /// This way you can build custom containers for specific days only, leaving rest as default.

          // Example: every 15th of month, we have a flight, we can place an icon in the container like that:
          if (day.day == 13 || day.day == 20 || day.day == 24) {
            return Container(
              decoration: new BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(color: app_orange_color, width: 1.0),
              ),
              child: Center(
                child: Text(
                  day.day.toString(),
                  textAlign: TextAlign.center,
                  style: gray__14__500,
                ),
              ),
              height: 32,
              width: 32,
            );
          } else if (day.day == DateTime.now().day &&
              day.month == DateTime.now().month) {
            return Container(
              decoration: new BoxDecoration(
                color: app_light_purple_two_color,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(color: app_orange_color, width: 1.0),
              ),
              child: Center(
                child: Text(
                  day.day.toString(),
                  textAlign: TextAlign.center,
                  style: gray__14__500.copyWith(color: app_white_color),
                ),
              ),
              height: 32,
              width: 32,
            );
          } else {
            return null;
          }
        },
        weekFormat: false,
        markedDatesMap: _markedDateMap,
        height: 310.0,
        selectedDateTime: _currentDate,
        daysHaveCircularBorder: false,
        daysTextStyle: gray__14__500,
        // todayTextStyle: gray__14__500.copyWith(color: app_white_color),
        todayButtonColor: Colors.transparent,
        todayBorderColor: Colors.transparent,
        weekendTextStyle: gray__14__500,
        weekdayTextStyle: orange__14__600,
        dayPadding: 4,
        //showHeader: false,
        //showHeaderButton: false,
        headerTextStyle: black__18__600.copyWith(color: app_black_color),
        prevDaysTextStyle: gray__14__500.copyWith(color: app_gray_four_color),
        nextDaysTextStyle: black__18__600.copyWith(color: app_gray_four_color),

        /// null for not rendering any border, true for circular border, false for rectangular border
      ),
    );
  }

  _upCommingPlansWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Upcoming plans'),
          SizedBox(height: 22),
          Row(
            children: [
              Text(
                '11 January',
                style: orange__14__600.copyWith(color: app_black_color),
              ),
              SizedBox(width: 12),
              Text(
                'Today',
                style: orange__14__600.copyWith(color: app_gray_three_color),
              )
            ],
          ),
          UpCommingPlansTile(
            title: "08:00 AM",
            seperatorColor: app_green_color,
            headerText: "Programming Basics",
            footerText: "Webinar Course",
          ),
          UpCommingPlansTile(
            title: "08:00 AM",
            seperatorColor: app_green_color,
            headerText: "Programming Basics",
            footerText: "Webinar Course",
          ),
          UpCommingPlansTile(
            title: "08:00 AM",
            seperatorColor: app_green_color,
            headerText: "Programming Basics",
            footerText: "Webinar Course",
          ),
        ],
      ),
    );
  }
}
