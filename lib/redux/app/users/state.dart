import 'package:admin/models/user/user.dart';

class UsersState {}

class UserLoadingFailure extends UsersState {}

class UsersLoaded extends UsersState {
  UsersLoaded(this.users);
  final List<User> users;
}
