// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../models/conference/conference.dart' as _i7;
import '../models/user/user.dart' as _i6;
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
      final args = routeData.argsAs<UserEditScreenRouteArgs>(
          orElse: () => const UserEditScreenRouteArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.UserEditScreen(key: args.key, user: args.user));
    },
    ConferenceEditScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ConferenceEditScreenRouteArgs>(
          orElse: () => const ConferenceEditScreenRouteArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.ConferenceEditScreen(
              key: args.key, conference: args.conference));
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
class UserEditScreenRoute extends _i4.PageRouteInfo<UserEditScreenRouteArgs> {
  UserEditScreenRoute({_i5.Key? key, _i6.User? user})
      : super(name,
            path: '/user-edit-screen',
            args: UserEditScreenRouteArgs(key: key, user: user));

  static const String name = 'UserEditScreenRoute';
}

class UserEditScreenRouteArgs {
  const UserEditScreenRouteArgs({this.key, this.user});

  final _i5.Key? key;

  final _i6.User? user;
}

/// generated route for [_i3.ConferenceEditScreen]
class ConferenceEditScreenRoute
    extends _i4.PageRouteInfo<ConferenceEditScreenRouteArgs> {
  ConferenceEditScreenRoute({_i5.Key? key, _i7.Conference? conference})
      : super(name,
            path: '/conference-edit-screen',
            args: ConferenceEditScreenRouteArgs(
                key: key, conference: conference));

  static const String name = 'ConferenceEditScreenRoute';
}

class ConferenceEditScreenRouteArgs {
  const ConferenceEditScreenRouteArgs({this.key, this.conference});

  final _i5.Key? key;

  final _i7.Conference? conference;
}
