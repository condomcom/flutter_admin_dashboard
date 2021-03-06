import 'package:admin/models/activity/activity.dart';
import 'package:admin/router/router.gr.dart';
import 'package:admin/utils/constants.dart';
import 'package:auto_route/auto_route.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class ActivitiesTable extends StatelessWidget {
  const ActivitiesTable({
    Key? key,
    required this.activities,
  }) : super(key: key);

  final List<Activity> activities;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Активности",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              ElevatedButton.icon(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1,
                  ),
                ),
                onPressed: () => _openEditScreen(context),
                icon: Icon(Icons.add),
                label: Text("Добавить"),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              columns: [
                DataColumn(
                  label: Text("ID"),
                ),
                DataColumn(
                  label: Text("Название"),
                ),
                DataColumn(
                  label: Text("Описание"),
                ),
              ],
              rows: List.generate(
                activities.length,
                (index) => _buildDataRow(context, activities[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow _buildDataRow(BuildContext context, Activity activity) {
    return DataRow(
      cells: [
        DataCell(
          Text('${activity.id}'),
          onTap: () => _openEditScreen(context, activity),
        ),
        DataCell(
          Text(activity.shortName ?? ''),
          onTap: () => _openEditScreen(context, activity),
        ),
        DataCell(
          Text(activity.description ?? ''),
          onTap: () => _openEditScreen(context, activity),
        ),
      ],
    );
  }

  void _openEditScreen(BuildContext context, [Activity? activity]) {
    AutoRouter.of(context).push(
      ActivityEditScreenRoute(
        activity: activity,
      ),
    );
  }
}
