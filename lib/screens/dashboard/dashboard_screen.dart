import 'package:admin/redux/redux.dart';
import 'package:admin/screens/dashboard/components/components.dart';
import 'package:admin/screens/home/home.dart';
import 'package:admin/utils/constants.dart';
import 'package:admin/utils/di/di.dart';
import 'package:flutter/material.dart';
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
            HomePage(),
          ],
        ),
      ),
    );
  }
}
