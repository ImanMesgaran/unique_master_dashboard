import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unique_master_dashboard/core/global/text_styles.dart';
import 'package:unique_master_dashboard/features/schedules/presentation/widgets/app_bar.dart/custom_app_bar.dart';
import 'package:unique_master_dashboard/features/schedules/presentation/widgets/drawer/custom_navigation_drawer.dart';

class MobilePageScaffold extends StatefulWidget {
  MobilePageScaffold({Key key}) : super(key: key);

  @override
  _MobilePageScaffoldState createState() => _MobilePageScaffoldState();
}

class _MobilePageScaffoldState extends State<MobilePageScaffold> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _drawerKey,
        appBar: CustomAppBar(),
        backgroundColor: Colors.grey,
        drawer: CustomNavigationDrawer(),
        body: Container(
          height: 200,
          width: 200,
          color: Colors.red,
        ));
  }
}
