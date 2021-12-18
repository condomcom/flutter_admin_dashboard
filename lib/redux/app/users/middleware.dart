import 'dart:async';
import 'dart:developer';

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
    } else if (action is CreateUserAction) {
      _createUser(action, store);
    } else if (action is UpdateUserAction) {
      _editUser(action, store);
    } else if (action is DeleteUserAction) {
      _deleteUser(action, store);
    }
  }

  Future<void> _deleteUser(
      DeleteUserAction action, Store<AppState> store) async {
    try {
      await usersRepository.delete(action.userId);
      store.dispatch(LoadUsersAction());
      action.onSuccesed();
    } on Exception catch (e) {
      // store.dispatch(UsersLoadingFailureAction());
      log('Delete user exception\n$e');
    }
  }

  Future<void> _editUser(UpdateUserAction action, Store<AppState> store) async {
    try {
      await usersRepository.update(action.user);
      store.dispatch(LoadUsersAction());
      action.onSuccesed();
    } on Exception catch (e) {
      // store.dispatch(UsersLoadingFailureAction());
      log('Edit user exception\n$e');
    }
  }

  Future<void> _createUser(
    CreateUserAction action,
    Store<AppState> store,
  ) async {
    try {
      await usersRepository.create(action.user);
      final userState = store.state.usersState;
      if (userState is UsersLoaded) {
        store.dispatch(
          UsersLoadedAction(userState.users..add(action.user)),
        );
      } else {
        store.dispatch(LoadUsersAction());
      }
      action.onSuccesed();
    } on Exception catch (e) {
      log('Create user exception\n$e');
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
