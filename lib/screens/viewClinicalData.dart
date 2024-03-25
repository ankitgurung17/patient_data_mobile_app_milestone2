import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:patient_data_mobile_app_milestone2/screens/viewClinicalTests.dart';

class ClinicalData extends StatefulWidget {
  @override
  _ClinicalDataState createState() => _ClinicalDataState();
}

class _ClinicalDataState extends State<ClinicalData> {
  List<Map<String, dynamic>> patientData = [];

  @override
  void initState() {
    super.initState();
    fetchPatientData();
  }

  Future<void> fetchPatientData() async {
    final apiUrl = 'https://customer-care-api-hf68.onrender.com/patients/id/tests'; 
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        setState(() {
          patientData = json.decode(response.body);
        });
      } else {
        print('Failed to fetch patient data');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Patient Clinical Data',
          style: TextStyle(color: Color.fromARGB(255, 68, 156, 228)),
        ),
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

  void _navigateToClinicalTests(
      BuildContext context, Map<String, dynamic> patient) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ClinicalTests(patient: patient),
      ),
    );
  }

  void _showDeleteConfirmationDialog(
      BuildContext context, Map<String, dynamic> patient) {
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
                  patientData.removeWhere((element) => element['id'] == patient['id']);
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
