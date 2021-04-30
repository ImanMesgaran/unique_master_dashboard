import 'package:flutter/material.dart';

abstract class ICustomNavigators {
  GlobalKey<NavigatorState> mainNavigatorKey;

  GlobalKey<NavigatorState> globalNavigatorKey;

  Future<dynamic> pushNamed({@required String routeName, dynamic arguments});

  Future<dynamic> pushAndRemoveUntil({
    @required String routeName,
    bool Function(Route<dynamic>) predicate,
    dynamic arguments,
  });

  Future<dynamic> pushAndClearStack(
      {@required String routeName, dynamic arguments});

  void pop({dynamic param = null});
}
