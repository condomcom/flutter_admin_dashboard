import 'package:admin/redux/app/activities/activities.dart';
import 'package:admin/redux/app/conferences/conferences.dart';
import 'package:admin/redux/app/state.dart';
import 'package:admin/redux/app/users/actions.dart';
import 'package:admin/redux/app/users/users.dart';
import 'package:redux/redux.dart';

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, UsersLoadingFailureAction>(
    _onUsersLoadingFailure,
  ),
  TypedReducer<AppState, UsersLoadedAction>(
    _onUsersLoaded,
  ),
  TypedReducer<AppState, ConferencesLoadingFailureAction>(
    _onConferencesLoadingFailure,
  ),
  TypedReducer<AppState, ConferencesLoadedAction>(
    _onConferencesLoaded,
  ),
  TypedReducer<AppState, ActivitiesLoadingFailureAction>(
    _onActivitiesLoadingFailure,
  ),
  TypedReducer<AppState, ActivitiesLoadedAction>(
    _onActivitiesLoaded,
  ),
]);

AppState _onUsersLoadingFailure(
        AppState state, UsersLoadingFailureAction action) =>
    state.copyWith(
      usersState: UserLoadingFailure(),
    );

AppState _onUsersLoaded(AppState state, UsersLoadedAction action) =>
    state.copyWith(
      usersState: UsersLoaded(action.users),
    );

AppState _onConferencesLoadingFailure(
        AppState state, ConferencesLoadingFailureAction action) =>
    state.copyWith(
      conferencesState: ConferencesLoadingFailure(),
    );

AppState _onConferencesLoaded(AppState state, ConferencesLoadedAction action) =>
    state.copyWith(
      conferencesState: ConferencesLoaded(action.conferences),
    );

AppState _onActivitiesLoadingFailure(
        AppState state, ActivitiesLoadingFailureAction action) =>
    state.copyWith(
      activitiesState: ActivitiesLoadingFailure(),
    );

AppState _onActivitiesLoaded(AppState state, ActivitiesLoadedAction action) =>
    state.copyWith(
      activitiesState: ActivitiesLoaded(action.activities),
    );
