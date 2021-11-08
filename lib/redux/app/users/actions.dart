import 'package:admin/models/user/user.dart';
import 'package:admin/redux/app/actions.dart';

class LoadUsersAction extends UserAction {}

class CreateUserAction extends UserAction {
  CreateUserAction(this.user, {required this.onSucces});
  final User user;
  final Function() onSucces;
}

class UsersLoadedAction extends UserAction {
  UsersLoadedAction(this.users);
  final List<User> users;
}

class UsersLoadingFailureAction extends UserAction {}
