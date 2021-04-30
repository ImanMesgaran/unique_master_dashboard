import 'package:flutter/material.dart';
import '../../injection_container.dart' as di;
import '../navigation/routes/routes.dart';
import 'navigation_service_interface.dart';
import 'routes/custom_navigators_interface.dart';

class NavigationService extends INavigationService {
  final _customNavigator = di.getIt<ICustomNavigators>();

  @override
  Future<dynamic> goBack({dynamic param = null}) async {
    return _customNavigator.mainNavigatorKey.currentState.pop(param);
  }

  @override
  Future pushToSplash({Object arguments = null}) {
    return this.pushAndClearStack(
      name: Routes.initialPage,
      arguments: arguments,
    );
  }

  @override
  Future pushToHomePage() {
    return _customNavigator.mainNavigatorKey.currentState
        .pushNamedAndRemoveUntil(
      Routes.homePage,
      (route) => false,
    );
  }

  /// internal methods
  ///
  Future<dynamic> pushNamed({@required String name, Object arguments = null}) {
    return this._customNavigator.pushNamed(
          routeName: name,
          arguments: arguments,
        );
  }

  Future<dynamic> pushAndClearStack(
      {@required String name, Object arguments = null}) {
    return this._customNavigator.pushAndClearStack(
          routeName: name,
          arguments: arguments,
        );
  }

  Future<dynamic> pushAndRemoveUntil({
    @required String name,
    String removeUntil,
    Object arguments = null,
  }) {
    return this._customNavigator.pushAndRemoveUntil(
          routeName: name,
          predicate: ModalRoute.withName(removeUntil),
          arguments: arguments,
        );
  }

  /// External getters
  ///
  @override
  GlobalKey<NavigatorState> get getGlobalNavigatorKey =>
      this._customNavigator.globalNavigatorKey;

  @override
  GlobalKey<NavigatorState> get getMainNavigatorKey =>
      this._customNavigator.mainNavigatorKey;
}
