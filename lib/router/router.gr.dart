// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../screens/conference/conference.dart' as _i3;
import '../screens/main/main_screen.dart' as _i1;
import '../screens/user/user.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    MainScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.MainScreen());
    },
    UserEditScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.UserEditScreen());
    },
    ConferenceEditScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ConferenceEditScreen());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(MainScreenRoute.name, path: '/'),
        _i4.RouteConfig(UserEditScreenRoute.name, path: '/user-edit-screen'),
        _i4.RouteConfig(ConferenceEditScreenRoute.name,
            path: '/conference-edit-screen')
      ];
}

/// generated route for [_i1.MainScreen]
class MainScreenRoute extends _i4.PageRouteInfo<void> {
  const MainScreenRoute() : super(name, path: '/');

  static const String name = 'MainScreenRoute';
}

/// generated route for [_i2.UserEditScreen]
class UserEditScreenRoute extends _i4.PageRouteInfo<void> {
  const UserEditScreenRoute() : super(name, path: '/user-edit-screen');

  static const String name = 'UserEditScreenRoute';
}

/// generated route for [_i3.ConferenceEditScreen]
class ConferenceEditScreenRoute extends _i4.PageRouteInfo<void> {
  const ConferenceEditScreenRoute()
      : super(name, path: '/conference-edit-screen');

  static const String name = 'ConferenceEditScreenRoute';
}
