import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unique_master_dashboard/core/global/text_styles.dart';
import 'package:unique_master_dashboard/features/schedules/presentation/widgets/app_bar.dart/custom_app_bar.dart';

class WebPageScaffold extends StatefulWidget {
  WebPageScaffold({Key key}) : super(key: key);

  @override
  _WebPageScaffoldState createState() => _WebPageScaffoldState();
}

class _WebPageScaffoldState extends State<WebPageScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        backgroundColor: Colors.grey,
        body: Container(
          height: 200,
          width: 200,
          color: Colors.red,
        ));
  }
}
