import 'package:admin/redux/app/activities/state.dart';
import 'package:admin/redux/app/conferences/conferences.dart';
import 'package:admin/redux/app/users/users.dart';

class AppState {
  AppState({
    this.usersState,
    this.conferencesState,
    this.activitiesState,
  });

  final UsersState? usersState;
  final ConferencesState? conferencesState;
  final ActivitiesState? activitiesState;

  AppState copyWith({
    UsersState? usersState,
    ConferencesState? conferencesState,
    ActivitiesState? activitiesState,
  }) {
    return AppState(
      usersState: usersState ?? this.usersState,
      conferencesState: conferencesState ?? this.conferencesState,
      activitiesState: activitiesState ?? this.activitiesState,
    );
  }
}
