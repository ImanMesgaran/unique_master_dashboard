import 'package:flutter/material.dart';
import 'package:unique_master_dashboard/core/global/colors_web.dart';
import 'package:unique_master_dashboard/core/global/text_styles.dart';

import '../drawer/custom_navigation_drawer.dart';

/// A responsive scaffold for our application.
/// Displays the navigation drawer alongside the [Scaffold] if the screen/window size is large enough
class AppScaffold extends StatelessWidget {
  const AppScaffold({
    @required this.body,
    @required this.pageTitle,
    Key key,
    @required this.selectedItem,
  }) : super(key: key);

  final Widget body;
  final String pageTitle;
  final int selectedItem;

  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width < 600;
    return Row(
      children: [
        if (!displayMobileLayout)
          CustomNavigationDrawer(
            permanentlyDisplay: true,
            selectedItem: selectedItem,
          ),
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              // when the app isn't displaying the mobile version of app, hide the menu button that is used to open the navigation drawer
              automaticallyImplyLeading: displayMobileLayout,
              title: Text(pageTitle, style: gray__24__400),
              backgroundColor: app_white_color,
            ),
            drawer: displayMobileLayout
                ? const CustomNavigationDrawer(
                    permanentlyDisplay: false,
                  )
                : null,
            body: body,
          ),
        )
      ],
    );
  }
}
