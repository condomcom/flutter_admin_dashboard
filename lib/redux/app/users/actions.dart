import 'package:admin/models/user/user.dart';
import 'package:admin/redux/app/actions.dart';

class LoadUsersAction extends UserAction {}

class CreateUserAction extends UserAction {
  CreateUserAction(this.user, {required this.onSuccesed});
  final User user;
  final Function() onSuccesed;
}

class UsersLoadedAction extends UserAction {
  UsersLoadedAction(this.users);
  final List<User> users;
}

class EditUserAction extends UserAction {
  EditUserAction(this.user, {required this.onSuccesed});
  final User user;
  final Function() onSuccesed;
}

class DeleteUserAction extends UserAction {
  DeleteUserAction(this.userId, {required this.onSuccesed});
  final String userId;
  final Function() onSuccesed;
}

class UsersLoadingFailureAction extends UserAction {}
