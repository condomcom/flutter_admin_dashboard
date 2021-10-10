import 'package:admin/redux/app/users/users.dart';

class AppState {
  AppState(this.usersState);

  final UsersState usersState;

  AppState copyWith({
    UsersState? usersState,
  }) {
    return AppState(
      usersState ?? this.usersState,
    );
  }
}
