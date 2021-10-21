import 'package:admin/redux/redux.dart';
import 'package:admin/widgets/tables/tables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class UsersTableLoader extends StatelessWidget {
  const UsersTableLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(converter: (store) {
      return store.state;
    }, builder: (BuildContext context, AppState state) {
      if (state.usersState is UsersLoaded) {
        return UsersTable(users: (state.usersState! as UsersLoaded).users);
      }
      return CircularProgressIndicator();
    });
  }
}
