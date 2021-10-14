import 'package:admin/redux/redux.dart';
import 'package:admin/screens/dashboard/components/my_fields.dart';
import 'package:admin/utils/constants.dart';
import 'package:admin/utils/di/di.dart';
import 'package:admin/utils/responsive.dart';
import 'package:admin/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'components/header.dart';

import 'components/storage_details.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    Get.get<Store<AppState>>().dispatch(LoadAll());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      // MyFiles(),
                      // SizedBox(height: defaultPadding),
                      // RecentFiles(),
                      UsersTableLoader(),
                      SizedBox(height: defaultPadding),
                      ConferencesTableLoader(),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) StarageDetails(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: StarageDetails(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

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

class ConferencesTableLoader extends StatelessWidget {
  const ConferencesTableLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(converter: (store) {
      return store.state;
    }, builder: (BuildContext context, AppState state) {
      if (state.conferencesState is ConferencesLoaded) {
        return ConferencesTable(
            conferences:
                (state.conferencesState! as ConferencesLoaded).conferences);
      }
      return CircularProgressIndicator();
    });
  }
}
