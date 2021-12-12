import 'package:admin/screens/dashboard/components/components.dart';
import 'package:admin/utils/constants.dart';
import 'package:admin/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTable = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        if (!Responsive.isMobile(context))
          Align(
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: GroupButton(
                  spacing: 10,
                  isRadio: true,
                  selectedButton: _selectedTable,
                  groupingType: GroupingType.row,
                  alignment: Alignment.centerLeft,
                  groupRunAlignment: GroupRunAlignment.start,
                  mainGroupAlignment: MainGroupAlignment.start,
                  crossGroupAlignment: CrossGroupAlignment.start,
                  unselectedColor: theme.canvasColor,
                  unselectedTextStyle:
                      theme.textTheme.bodyText1!.copyWith(color: Colors.white),
                  buttons: const ['Пользователи', 'Конференции', 'Активности'],
                  borderRadius: BorderRadius.circular(10),
                  onSelected: (i, selected) =>
                      setState(() => _selectedTable = i),
                ),
              ),
            ),
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  _buildCurrentTable(),
                  SizedBox(height: defaultPadding),
                  if (Responsive.isMobile(context)) ...[
                    ConferencesTableLoader(),
                    SizedBox(height: defaultPadding),
                    ActivitiesTableLoader(),
                    SizedBox(height: defaultPadding),
                    StarageDetails(),
                  ],
                ],
              ),
            ),
            if (!Responsive.isMobile(context)) SizedBox(width: defaultPadding),
            // On Mobile means if the screen is less than 850 we dont want to show it
            if (!Responsive.isMobile(context))
              Expanded(
                flex: 2,
                child: StarageDetails(),
              ),
          ],
        )
      ],
    );
  }

  Widget _buildCurrentTable() {
    switch (_selectedTable) {
      case 1:
        return ConferencesTableLoader();
      case 2:
        return ActivitiesTableLoader();
      case 0:
      default:
        return UsersTableLoader();
    }
  }
}
