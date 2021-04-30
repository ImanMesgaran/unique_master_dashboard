import 'package:flutter/material.dart';

abstract class INavigationService {
  GlobalKey<NavigatorState> get getMainNavigatorKey;

  GlobalKey<NavigatorState> get getGlobalNavigatorKey;

  // pop - go back
  Future<dynamic> goBack({dynamic param = null});

  // Splash Route
  Future<dynamic> pushToSplash();

  // Home route
  Future pushToHomePage();

  // Schedules Page
  Future pushToSchedulesPage();
}
