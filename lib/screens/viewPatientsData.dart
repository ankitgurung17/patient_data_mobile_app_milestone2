import 'package:flutter/material.dart';

class PatientDataScreen extends StatelessWidget {
  final List<Map<String, dynamic>> patientData = [
    {
      'id': 1,
      'first_name': 'Ankit',
      'last_name': 'Gurung',
      'dob': '08/04/1996',
      'gender': 'Male',
      'phone_number': '6475544631',
      'email_address': 'ankitgurung98161@gmail.com',
      'address': '1 savarin street'
    },
    {
      'id': 2,
      'first_name': 'Anjali',
      'last_name': 'Magar',
      'dob': '08/04/1996',
      'gender': 'Female',
      'phone_number': '4376785642',
      'email_address': 'anjalimagar26@gmail.com',
      'address': '07 hart avenue'
    },
    {
      'id': 3,
      'first_name': 'Avicek',
      'last_name': 'khanal',
      'dob': '04/10/1996',
      'gender': 'Male',
      'phone_number': '4371234544',
      'email_address': 'avicekkhanal@gmail.com',
      'address': '1 savarin street'
    },
    {
      'id': 4,
      'first_name': 'Ritz',
      'last_name': 'Libetario',
      'dob': '04/11/1996',
      'gender': 'Male',
      'phone_number': '8056787865',
      'email_address': 'ritzghever@gmail.com',
      'address': '1110 finch avenue west'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Patient Data'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('First Name')),
            DataColumn(label: Text('Last Name')),
            DataColumn(label: Text('Date of Birth')),
            DataColumn(label: Text('Gender')),
            DataColumn(label: Text('Phone number')),
            DataColumn(label: Text('Email Address')),
            DataColumn(label: Text('Address')),
          ],
          rows: patientData.map((patient) {
            return DataRow(
              cells: [
                DataCell(Text(patient['id'].toString())),
                DataCell(Text(patient['first_name'])),
                DataCell(Text(patient['last_name'])),
                DataCell(Text(patient['dob'])),
                DataCell(Text(patient['gender'])),
                DataCell(Text(patient['phone_number'])),
                DataCell(Text(patient['email_address'])),
                DataCell(Text(patient['address'])),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

