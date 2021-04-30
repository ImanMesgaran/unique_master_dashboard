import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:unique_master_dashboard/features/schedules/presentation/cubit/cubit/drawer_cubit.dart';
import 'package:unique_master_dashboard/features/schedules/presentation/widgets/app_scaffold/app_scaffold.dart';
import 'package:easy_localization/easy_localization.dart';
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
      body: FixedTimeline.tileBuilder(
        builder: TimelineTileBuilder.connectedFromStyle(
          contentsAlign: ContentsAlign.basic,
          oppositeContentsBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('opposite\ncontents'),
          ),
          contentsBuilder: (context, index) => Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Contents'),
            ),
          ),
          connectorStyleBuilder: (context, index) => ConnectorStyle.solidLine,
          indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
          itemCount: 3,
        ),
      ),
    );
  }
}
