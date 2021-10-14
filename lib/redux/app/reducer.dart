import 'package:admin/redux/app/state.dart';
import 'package:admin/redux/app/users/actions.dart';
import 'package:admin/redux/app/users/users.dart';
import 'package:redux/redux.dart';

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, UsersLoadingFailureAction>(_onLoadingFailure),
  TypedReducer<AppState, UsersLoadedAction>(_onLoaded),
]);

AppState _onLoadingFailure(AppState state, UsersLoadingFailureAction action) =>
    state.copyWith(
      usersState: UserLoadingFailure(),
    );

AppState _onLoaded(AppState state, UsersLoadedAction action) => state.copyWith(
      usersState: UsersLoaded(action.users),
    );
