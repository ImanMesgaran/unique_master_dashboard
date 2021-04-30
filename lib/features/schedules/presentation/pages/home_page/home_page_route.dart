import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unique_master_dashboard/core/global/colors_web.dart';

import '../../widgets/app_scaffold/app_scaffold.dart';

class HomePageRoute extends StatefulWidget {
  HomePageRoute({Key key}) : super(key: key);

  @override
  _HomePageRouteState createState() => _HomePageRouteState();
}

class _HomePageRouteState extends State<HomePageRoute> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        selectedItem: 0,
        pageTitle: "home_page.title".tr(),
        body: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: app_background_color,
          child: Text("global.not_implemented_page".tr()),
        ));
  }
}
