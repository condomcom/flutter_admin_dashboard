import 'package:admin/models/user/user.dart';
import 'package:admin/redux/app/actions.dart';

class LoadUsersAction extends UserAction {}

class UsersLoadedAction extends UserAction {
  UsersLoadedAction(this.users);
  final List<User> users;
}

class UsersLoadingFailureAction extends UserAction {}
