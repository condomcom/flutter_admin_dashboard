import 'package:admin/redux/app/conferences/conferences.dart';
import 'package:admin/redux/app/users/users.dart';

class AppState {
  AppState({
    this.usersState,
    this.conferencesState,
  });

  final UsersState? usersState;
  final ConferencesState? conferencesState;

  AppState copyWith({
    UsersState? usersState,
    ConferencesState? conferencesState,
  }) {
    return AppState(
      usersState: usersState ?? this.usersState,
      conferencesState: conferencesState ?? this.conferencesState,
    );
  }
}
