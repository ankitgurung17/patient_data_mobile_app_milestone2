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
    final apiUrl = 'http://localhost:3000/patients/6602216b19457ef51270c029/tests';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        setState(() {
          patientData = List<Map<String, dynamic>>.from(json.decode(response.body));
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
              title: Text('6602216b19457ef51270c029'), // Fixed ID
              subtitle: Text('Test Date: ${patient['date']}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: () {
                      _navigateToClinicalTests(context, patient);
                      print('View details for ID: 6602216b19457ef51270c029'); // Fixed ID
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _showDeleteConfirmationDialog(patient['_id']);
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

  void _showDeleteConfirmationDialog(String patientId) async {
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
                deleteClinicalData('_id'); // Fixed ID
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteClinicalData(String id) async {
    final apiUrl = 'http://localhost:3000/patients/6602216b19457ef51270c029/tests/$id';
    try {
      final response = await http.delete(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        // Deletion successful
        setState(() {
          // Remove the deleted entry from the local list
          patientData.removeWhere((element) => element['_id'] == id);
        });
      } else {
        print('Failed to delete clinical data');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}