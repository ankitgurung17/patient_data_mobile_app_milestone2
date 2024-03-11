import 'package:flutter/material.dart';
import 'package:patient_data_mobile_app_milestone2/screens/viewClinicalTests.dart';

class ClinicalData extends StatefulWidget {
  @override
  _ClinicalDataState createState() => _ClinicalDataState();
}

class _ClinicalDataState extends State<ClinicalData> {
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
        title: const Text('Patient Clinical Data', style: TextStyle(color: Color.fromARGB(255, 68, 156, 228)),),
      ),
      body: ListView.builder(
        itemCount: patientData.length,
        itemBuilder: (context, index) {
          var patient = patientData[index];
          return Card(
            child: ListTile(
              title: Text('${patient['id']}'),
              subtitle: Text('Test Date: ${patient['date']}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: () {
                      _navigateToClinicalTests(context, patient);
                      print('View details for ID: ${patient['id']}');
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _showDeleteConfirmationDialog(context, patient);
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

  void _navigateToClinicalTests(BuildContext context, Map<String, dynamic> patient) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ClinicalTests(patient: patient),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, Map<String, dynamic> patient) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure you want to delete this clinical data?'),
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
                int index = patientData.indexWhere((element) => element['id'] == patient['id']);
                if (index != -1) {
                  patientData.removeAt(index);
                }
              });

              Navigator.of(context).pop(); 
            },
          ),
        ],
      );
    },
  );
}
}