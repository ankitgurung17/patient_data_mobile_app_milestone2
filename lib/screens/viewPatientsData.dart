import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PatientsData extends StatefulWidget {
  @override
  _PatientsDataState createState() => _PatientsDataState();
}

class _PatientsDataState extends State<PatientsData> {
  List<dynamic> patientData = [];

  @override
  void initState() {
    super.initState();
    fetchPatientData();
  }

  Future<void> fetchPatientData() async {
    final apiUrl = 'http://localhost:3000/patients';
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

  void _navigateToPatientDetails(BuildContext context, dynamic patient) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PatientDetailsScreen(patient: patient),
      ),
    );
  }

  Future<void> _showDeleteConfirmationDialog(String patientId) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete this patient?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _deletePatient(patientId);
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deletePatient(String patientId) async {
    final apiUrl = 'http://localhost:3000/patients/$patientId';
    try {
      final response = await http.delete(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        setState(() {
          // Remove the deleted patient from the list
          patientData.removeWhere((patient) => patient['_id'] == patientId);
        });
      } else {
        print('Failed to delete patient data');
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
              title: Text('Name: ${patient['firstName']} ${patient['lastName']}'),
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
                      _navigateToPatientDetails(context, patient);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
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
}

class PatientDetailsScreen extends StatelessWidget {
  final dynamic patient;

  const PatientDetailsScreen({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Patient Details',
          style: TextStyle(color: Color.fromARGB(255, 68, 156, 228)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('ID', patient['_id']),
              _buildDetailRow('First Name', patient['firstName']),
              _buildDetailRow('Last Name', patient['lastName']),
              _buildDetailRow('Phone Number', patient['phoneNumber']),
              _buildDetailRow('Email Address', patient['emailAddress']),
              _buildDetailRow('Date of Birth', patient['dateOfBirth']),
              _buildDetailRow('Address', patient['address']),
              _buildDetailRow('Marital Status', patient['marital']),
              _buildDetailRow('Gender', patient['gender']),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 8.0),
          Expanded(
            child: Text('$value'),
          ),
        ],
      ),
    );
  }
}
