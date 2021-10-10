import 'dart:async';

import 'package:admin/redux/app/actions.dart';
import 'package:admin/redux/app/app.dart';
import 'package:admin/redux/app/users/actions.dart';
import 'package:admin/repositories/user/repository.dart';
import 'package:redux/redux.dart';

class UserMiddleware implements MiddlewareClass<AppState> {
  const UserMiddleware(this.usersRepository);

  final AbstractApiUserRepository usersRepository;

  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is UserAction) {
      _foundUserAction(action, store);
    }
    next(action);
  }

  Future<void> _foundUserAction(
    UserAction action,
    Store<AppState> store,
  ) async {
    if (action is LoadUsersAction) {
      _loadUsers(store);
    }
  }

  Future<void> _loadUsers(Store<AppState> store) async {
    try {
      final users = await usersRepository.getAll();
      store.dispatch(UsersLoadedAction(users));
    } on Exception catch (_) {
      store.dispatch(UsersLoadingFailureAction());
    }
  }
}
