import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Patient {
  String patientID = '';
  String date = '';
  String bloodPressure = '';
  String respiratoryRate = '';
  String bloodOxygenLevel = '';
  String heartbeatRate = '';
}

class NewClinicalData extends StatefulWidget {
  const NewClinicalData({Key? key}) : super(key: key);

  @override
  State<NewClinicalData> createState() => _NewClinicalDataState();
}

class _NewClinicalDataState extends State<NewClinicalData> {
  final _formKey = GlobalKey<FormState>();
  final Patient _patient = Patient();

  Future<void> _addClinicalData() async {
    final String apiUrl = 'https://your-api-endpoint.com/add-clinical-data';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'patientID': _patient.patientID,
          'date': _patient.date,
          'bloodPressure': _patient.bloodPressure,
          'respiratoryRate': _patient.respiratoryRate,
          'bloodOxygenLevel': _patient.bloodOxygenLevel,
          'heartbeatRate': _patient.heartbeatRate,
        }),
      );

      if (response.statusCode == 200) {
        // Clinical data added successfully, show success message
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Success'),
              content: const Text('Clinical data added successfully.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        // Handle unsuccessful clinical data addition
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Failed to add clinical data. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
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
          'New Clinical Record',
          style: TextStyle(color: Color.fromARGB(255, 68, 156, 228)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Patient ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the patient id!';
                  }
                  return null;
                },
                onSaved: (value) {
                  _patient.patientID = value!;
                },
              ),
              // Other form fields...
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _addClinicalData(); // Call the method to add clinical data
                  }
                },
                child: const Text('Add Clinical Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
