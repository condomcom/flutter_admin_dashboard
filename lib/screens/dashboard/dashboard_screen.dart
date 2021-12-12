import 'package:admin/controllers/menu_provider.dart';
import 'package:admin/redux/redux.dart';
import 'package:admin/screens/activity/activity.dart';
import 'package:admin/screens/conference/conference.dart';
import 'package:admin/screens/dashboard/components/components.dart';
import 'package:admin/screens/home/home.dart';
import 'package:admin/screens/user/user.dart';
import 'package:admin/utils/constants.dart';
import 'package:admin/utils/di/di.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'components/header.dart';

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
            _DashboardBody(),
          ],
        ),
      ),
    );
  }
}

class _DashboardBody extends StatelessWidget {
  const _DashboardBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    switch (menuProvider.selectedPageIndex) {
      case 1:
        return EditConferencePage(
          onCompleted: () => menuProvider.selectedPageIndex = 0,
        );
      case 2:
        return EditUserPage(
          onCompleted: () => menuProvider.selectedPageIndex = 0,
        );
      case 3:
        return ActivityEditPage(
          onCompleted: () => menuProvider.selectedPageIndex = 0,
        );
      case 0:
      default:
        return HomePage();
    }
  }
}
