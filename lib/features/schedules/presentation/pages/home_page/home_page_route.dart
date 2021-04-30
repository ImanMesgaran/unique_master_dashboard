import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_scaffold/app_scaffold.dart';

class HomePageRoute extends StatefulWidget {
  HomePageRoute({Key key}) : super(key: key);

  @override
  _HomePageRouteState createState() => _HomePageRouteState();
}

class _HomePageRouteState extends State<HomePageRoute> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        pageTitle: "home_page.title".tr(),
        body: Container(
          height: 200,
          width: 200,
          color: Colors.red,
        ));
  }
}
