// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../models/activity/activity.dart' as _i9;
import '../models/conference/conference.dart' as _i8;
import '../models/user/user.dart' as _i7;
import '../screens/activity/activity.dart' as _i4;
import '../screens/conference/conference.dart' as _i3;
import '../screens/main/main_screen.dart' as _i1;
import '../screens/user/user.dart' as _i2;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    MainScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.MainScreen());
    },
    UserEditScreenRoute.name: (routeData) {
      final args = routeData.argsAs<UserEditScreenRouteArgs>(
          orElse: () => const UserEditScreenRouteArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.UserEditScreen(key: args.key, user: args.user));
    },
    ConferenceEditScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ConferenceEditScreenRouteArgs>(
          orElse: () => const ConferenceEditScreenRouteArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.ConferenceEditScreen(
              key: args.key, conference: args.conference));
    },
    ActivityEditScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ActivityEditScreenRouteArgs>(
          orElse: () => const ActivityEditScreenRouteArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i4.ActivityEditScreen(key: args.key, activity: args.activity));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(MainScreenRoute.name, path: '/'),
        _i5.RouteConfig(UserEditScreenRoute.name, path: '/user-edit-screen'),
        _i5.RouteConfig(ConferenceEditScreenRoute.name,
            path: '/conference-edit-screen'),
        _i5.RouteConfig(ActivityEditScreenRoute.name,
            path: '/activity-edit-screen')
      ];
}

/// generated route for [_i1.MainScreen]
class MainScreenRoute extends _i5.PageRouteInfo<void> {
  const MainScreenRoute() : super(name, path: '/');

  static const String name = 'MainScreenRoute';
}

/// generated route for [_i2.UserEditScreen]
class UserEditScreenRoute extends _i5.PageRouteInfo<UserEditScreenRouteArgs> {
  UserEditScreenRoute({_i6.Key? key, _i7.User? user})
      : super(name,
            path: '/user-edit-screen',
            args: UserEditScreenRouteArgs(key: key, user: user));

  static const String name = 'UserEditScreenRoute';
}

class UserEditScreenRouteArgs {
  const UserEditScreenRouteArgs({this.key, this.user});

  final _i6.Key? key;

  final _i7.User? user;
}

/// generated route for [_i3.ConferenceEditScreen]
class ConferenceEditScreenRoute
    extends _i5.PageRouteInfo<ConferenceEditScreenRouteArgs> {
  ConferenceEditScreenRoute({_i6.Key? key, _i8.Conference? conference})
      : super(name,
            path: '/conference-edit-screen',
            args: ConferenceEditScreenRouteArgs(
                key: key, conference: conference));

  static const String name = 'ConferenceEditScreenRoute';
}

class ConferenceEditScreenRouteArgs {
  const ConferenceEditScreenRouteArgs({this.key, this.conference});

  final _i6.Key? key;

  final _i8.Conference? conference;
}

/// generated route for [_i4.ActivityEditScreen]
class ActivityEditScreenRoute
    extends _i5.PageRouteInfo<ActivityEditScreenRouteArgs> {
  ActivityEditScreenRoute({_i6.Key? key, _i9.Activity? activity})
      : super(name,
            path: '/activity-edit-screen',
            args: ActivityEditScreenRouteArgs(key: key, activity: activity));

  static const String name = 'ActivityEditScreenRoute';
}

class ActivityEditScreenRouteArgs {
  const ActivityEditScreenRouteArgs({this.key, this.activity});

  final _i6.Key? key;

  final _i9.Activity? activity;
}
