import 'package:admin/screens/activity/activity.dart';
import 'package:admin/screens/conference/conference.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/screens/user/user.dart';
import 'package:auto_route/auto_route.dart';

// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
// @MaterialAutoRouter
@MaterialAutoRouter(
  replaceInRouteName: '',
  routes: <AutoRoute>[
    AutoRoute(page: MainScreen, initial: true),
    AutoRoute(page: UserEditScreen),
    AutoRoute(page: ConferenceEditScreen),
    AutoRoute(page: ActivityEditScreen),
  ],
)
class $AppRouter {}
