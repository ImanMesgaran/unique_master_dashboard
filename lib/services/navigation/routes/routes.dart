import 'package:flutter/material.dart';

import '../../../features/schedules/presentation/pages/home_page/home_page_route.dart';

class Routes {
  // Splash
  static const String initialPage = '/';

  // Home
  static const String homePage = '/homePage';

  static Route<dynamic> getGeneratedRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      // Splash
      case initialPage:
        return MaterialPageRoute(
          builder: (BuildContext context) => HomePageRoute(),
        );

      // case homePage:
      //   return MaterialPageRoute(
      //     builder: (BuildContext context) => BlocProvider(
      //       create: (context) => di.getIt<HomeCubit>(),
      //       child: HomePageRoute(),
      //     ),
      //   );
    }
  }
}
