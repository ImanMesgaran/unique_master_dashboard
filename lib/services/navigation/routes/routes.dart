import 'package:flutter/material.dart';
import 'package:unique_master_dashboard/features/schedules/presentation/pages/schedules/schedules_page_route.dart';

import '../../../features/schedules/presentation/pages/home_page/home_page_route.dart';

class Routes {
  // Splash
  static const String initialPage = '/';

  // Home
  static const String homePage = '/homePage';

  // Schedules page
  static const String schedulesPage = '/schedulesPage';

  static Route<dynamic> getGeneratedRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      // Splash
      case initialPage:
        return MaterialPageRoute(
          builder: (BuildContext context) => HomePageRoute(
            selectedItem: 0,
          ),
        );

      case homePage:
        final _args = args as int;
        return MaterialPageRoute(
          builder: (BuildContext context) => HomePageRoute(
            selectedItem: _args,
          ),
        );

      case schedulesPage:
        return MaterialPageRoute(
          builder: (BuildContext context) => SchedulesPageRoute(),
        );
    }
  }
}
