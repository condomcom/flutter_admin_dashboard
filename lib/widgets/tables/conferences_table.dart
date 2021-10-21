import 'package:admin/models/conference/conference.dart';
import 'package:admin/utils/constants.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class ConferencesTable extends StatelessWidget {
  const ConferencesTable({
    Key? key,
    required this.conferences,
  }) : super(key: key);

  final List<Conference> conferences;

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
                "Конференции",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              ElevatedButton.icon(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1,
                  ),
                ),
                onPressed: () {},
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
                conferences.length,
                (index) => _buildDataRow(conferences[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow _buildDataRow(Conference conference) {
    return DataRow(
      cells: [
        DataCell(Text('${conference.id}')),
        DataCell(Text(conference.shortName ?? '')),
        DataCell(Text(conference.description ?? '')),
      ],
    );
  }
}
