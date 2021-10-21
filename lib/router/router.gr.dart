// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../screens/main/main_screen.dart' as _i1;
import '../screens/user/user.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MainScreenRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.MainScreen());
    },
    UserEditScreenRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.UserEditScreen());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(MainScreenRoute.name, path: '/'),
        _i3.RouteConfig(UserEditScreenRoute.name, path: '/user-edit-screen')
      ];
}

/// generated route for [_i1.MainScreen]
class MainScreenRoute extends _i3.PageRouteInfo<void> {
  const MainScreenRoute() : super(name, path: '/');

  static const String name = 'MainScreenRoute';
}

/// generated route for [_i2.UserEditScreen]
class UserEditScreenRoute extends _i3.PageRouteInfo<void> {
  const UserEditScreenRoute() : super(name, path: '/user-edit-screen');

  static const String name = 'UserEditScreenRoute';
}
