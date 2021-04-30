import 'package:flutter/material.dart';

import 'custom_navigators_interface.dart';

class CustomNavigators extends ICustomNavigators {
  final GlobalKey<NavigatorState> mainNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'main');

  final GlobalKey<NavigatorState> globalNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'global');

  Future<dynamic> pushNamed({@required String routeName, dynamic arguments}) {
    return globalNavigatorKey.currentState
        .pushNamed(routeName, arguments: arguments);
  }

  @override
  Future pushAndRemoveUntil(
      {@required String routeName,
      bool Function(Route<dynamic>) predicate,
      arguments}) {
    return globalNavigatorKey.currentState.pushNamedAndRemoveUntil(
      routeName,
      predicate,
      arguments: arguments,
    );
  }

  Future<dynamic> pushAndClearStack(
      {@required String routeName, dynamic arguments}) {
    return globalNavigatorKey.currentState.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  void pop({dynamic param = null}) {
    return globalNavigatorKey.currentState.pop(param);
  }
}
