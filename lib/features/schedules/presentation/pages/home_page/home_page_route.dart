import 'package:flutter/material.dart';

import 'mobile/mobile_page_scaffold.dart';
import 'web/web_page_scaffold.dart';

class HomePageRoute extends StatefulWidget {
  HomePageRoute({Key key}) : super(key: key);

  @override
  _HomePageRouteState createState() => _HomePageRouteState();
}

class _HomePageRouteState extends State<HomePageRoute> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 500) {
        return MobilePageScaffold();
      } else
        return WebPageScaffold();
    });
  }
}
