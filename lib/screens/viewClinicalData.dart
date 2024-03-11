import 'package:flutter/material.dart';

class ViewClinicalData extends StatelessWidget {
  final List<Map<String, dynamic>> patientData = [
    {
      'id': 1,
      'date': '3/10/2024',
      'blood_pressure': '80/60',
      'respiratory_rate': '95',
      'blood_oxygen_level': '97%',
      'heartbeat_rate': '87',
    },
    {
      'id': 2,
      'date': '3/3/2024',
      'blood_pressure': '96/70',
      'respiratory_rate': '85',
      'blood_oxygen_level': '100%',
      'heartbeat_rate': '75',
    },
    {
      'id': 3,
      'date': '2/10/2023',
      'blood_pressure': '94/60',
      'respiratory_rate': '79',
      'blood_oxygen_level': '76%',
      'heartbeat_rate': '78',
    },
    {
      'id': 4,
      'date': '1/1/2012',
      'blood_pressure': '93/62',
      'respiratory_rate': '88',
      'blood_oxygen_level': '89%',
      'heartbeat_rate': '77',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Clinical Data'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Date')),
            DataColumn(label: Text('Blood Pressure')),
            DataColumn(label: Text('Respiratory Rate')),
            DataColumn(label: Text('Blood Oxygen Level')),
            DataColumn(label: Text('Heart Rate')),
          ],
          rows: patientData.map((patient) {
            return DataRow(
              cells: [
                DataCell(Text(patient['id'].toString())),
                DataCell(Text(patient['date'])),
                DataCell(Text(patient['blood_pressure'])),
                DataCell(Text(patient['respiratory_rate'])),
                DataCell(Text(patient['blood_oxygen_level'])),
                DataCell(Text(patient['heartbeat_rate'])),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
