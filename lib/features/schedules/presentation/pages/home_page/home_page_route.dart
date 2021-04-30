import 'package:flutter/material.dart';

class HomePageRoute extends StatefulWidget {
  HomePageRoute({Key key}) : super(key: key);

  @override
  _HomePageRouteState createState() => _HomePageRouteState();
}

class _HomePageRouteState extends State<HomePageRoute> {
  @override
  Widget build(BuildContext context) {
    return Container(height: 200, width: 200, color: Colors.red);
  }
}
