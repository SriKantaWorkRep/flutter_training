import 'package:flutter/material.dart';

class DisplayDataTable extends StatefulWidget {
  const DisplayDataTable({super.key});

  @override
  State<DisplayDataTable> createState() => _DisplayDataTableState();
}

class _DisplayDataTableState extends State<DisplayDataTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data table"),
      ),
      body: Center(
        child: DataTable(
            columns: [
              DataColumn(label: Text("")),
              DataColumn(label: Text("")),
            ],
            rows: [
              DataRow(
                  cells: [
                DataCell(
                Switch.adaptive(value: true, onChanged: (value){

                })
                ),
                DataCell(Text("row")),
              ])
            ],
        ),
      ),
    );
  }
}
