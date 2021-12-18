import 'package:admin/models/user/user.dart';
import 'package:admin/router/router.gr.dart';
import 'package:admin/utils/constants.dart';
import 'package:auto_route/auto_route.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class UsersTable extends StatelessWidget {
  const UsersTable({
    Key? key,
    required this.users,
  }) : super(key: key);

  final List<User> users;

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
                "Пользователи",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              ElevatedButton.icon(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1,
                  ),
                ),
                onPressed: () {
                  AutoRouter.of(context).push(
                    UserEditScreenRoute(),
                  );
                },
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
                  label: Text("Фио"),
                ),
                DataColumn(
                  label: Text("Email"),
                ),
                DataColumn(
                  label: Text("Телефон"),
                ),
              ],
              rows: List.generate(
                users.length,
                (index) => _buildDataRow(context, users[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow _buildDataRow(BuildContext context, User user) {
    return DataRow(
      onSelectChanged: (_) {
        AutoRouter.of(context).push(
          UserEditScreenRoute(
            user: user,
          ),
        );
      },
      cells: [
        DataCell(Text('${user.name} ${user.patronymic} ${user.surname}')),
        DataCell(Text(user.email ?? '')),
        DataCell(Text(user.phone ?? '')),
      ],
    );
  }
}
