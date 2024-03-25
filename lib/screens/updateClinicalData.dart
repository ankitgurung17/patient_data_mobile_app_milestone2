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

class UpdateClinicalData extends StatefulWidget {
  const UpdateClinicalData({Key? key}) : super(key: key);

  @override
  State<UpdateClinicalData> createState() => _NewPatientDataState();
}

class _NewPatientDataState extends State<UpdateClinicalData> {
  final _formKey = GlobalKey<FormState>();
  final Patient _patient = Patient();

  Future<void> _updateClinicalData() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    final Map<String, dynamic> clinicalData = {
      'patientID': _patient.patientID,
      'date': _patient.date,
      'bloodPressure': _patient.bloodPressure,
      'respiratoryRate': _patient.respiratoryRate,
      'bloodOxygenLevel': _patient.bloodOxygenLevel,
      'heartbeatRate': _patient.heartbeatRate,
    };

    final String apiUrl =
        'https://customer-care-api-hf68.onrender.com/patients/${_patient.patientID}/tests';

    try {
      final response = await http.put(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(clinicalData),
      );

      if (response.statusCode == 200) {
        // Clinical data updated successfully
        print('Clinical data updated successfully');
      } else {
        // Handle unsuccessful response
        print('Failed to update clinical data');
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
          'Update Clinical Record',
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
              TextFormField(
                decoration: const InputDecoration(labelText: 'Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the date!';
                  }
                  return null;
                },
                onSaved: (value) {
                  _patient.date = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Blood Pressure'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter blood pressure of the patient!';
                  }
                  return null;
                },
                onSaved: (value) {
                  _patient.bloodPressure = value!;
                },
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Respiratory Rate'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter respiratory rate of the patient!';
                  }
                  return null;
                },
                onSaved: (value) {
                  _patient.respiratoryRate = value!;
                },
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Blood Oxygen Level'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter blood oxygen level of the patient!';
                  }
                  return null;
                },
                onSaved: (value) {
                  _patient.bloodOxygenLevel = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Heartbeat Rate'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter  heartbeat rate of the patient!';
                  }
                  return null;
                },
                onSaved: (value) {
                  _patient.heartbeatRate = value!;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: _updateClinicalData,
                    child: const Text('Update'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
