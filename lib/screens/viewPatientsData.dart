import 'package:flutter/material.dart';
import 'package:patient_data_mobile_app_milestone2/screens/viewpatientDetails.dart';

class PatientsData extends StatefulWidget {
  @override
  _PatientsDataState createState() => _PatientsDataState();
}

class _PatientsDataState extends State<PatientsData> {
  final List<Map<String, dynamic>> patientData = [
    {
      'id': 1,
      'firstName': 'Ankit',
      'lastName': 'Gurung',
      'phoneNumber': '6475544631',
      'emailAddress': 'ankitgurung98161@gmail.com',
      'dateOfBirth': '08/04/1996',
      'address': '1 savarin street',
      'marital': 'Single',
      'gender': 'Male'
    },
    {
      'id': 2,
      'firstName': 'Anjali',
      'lastName': 'Magar',
      'phoneNumber': '4376785642',
      'emailAddress': 'anjalimagar26@gmail.com',
      'dateOfBirth': '08/04/1996',
      'address': '07 hart avenue',
      'marital': 'Married',
      'gender': 'Female'
    },
    {
      'id': 3,
      'firstName': 'Avicek',
      'lastName': 'khanal',
      'phoneNumber': '4371234544',
      'emailAddress': 'avicekkhanal@gmail.com',
      'dateOfBirth': '04/10/1996',
      'address': '1 savarin street',
      'marital': 'Single',
      'gender': 'Male'
    },
    {
      'id': 4,
      'firstName': 'Ritz',
      'lastName': 'Libetario',
      'phoneNumber': '8056787865',
      'emailAddress': 'ritzghever@gmail.com',
      'dateOfBirth': '04/11/1996',
      'address': '1110 finch avenue west',
      'marital': 'Single',
      'gender': 'Male'
    },
  ];

  void _navigateToDetailsScreen(
      BuildContext context, Map<String, dynamic> patient) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PatientDetails(patient: patient),
      ),
    );
  }

  Future<void> _showDeleteConfirmationDialog(int index) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure you want to delete this patient?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                setState(() {
                  patientData.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'View Patients Data',
          style: TextStyle(color: Color.fromARGB(255, 68, 156, 228)),
        ),
      ),
      body: ListView.builder(
        itemCount: patientData.length,
        itemBuilder: (context, index) {
          var patient = patientData[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title:
                  Text('Name: ${patient['firstName']} ${patient['lastName']}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('DOB: ${patient['dateOfBirth']}'),
                  Text('Phone: ${patient['phoneNumber']}'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.visibility),
                    onPressed: () {
                      _navigateToDetailsScreen(context, patient);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _showDeleteConfirmationDialog(index);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
