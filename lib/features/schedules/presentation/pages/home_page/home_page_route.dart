import 'package:flutter/material.dart';
import 'package:unique_master_dashboard/features/schedules/presentation/widgets/drawer/custom_navigation_drawer.dart';

class HomePageRoute extends StatefulWidget {
  HomePageRoute({Key key}) : super(key: key);

  @override
  _HomePageRouteState createState() => _HomePageRouteState();
}

class _HomePageRouteState extends State<HomePageRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomNavigationDrawer(),
        body: Container(
          height: 200,
          width: 200,
          color: Colors.red,
        ));
  }
}
