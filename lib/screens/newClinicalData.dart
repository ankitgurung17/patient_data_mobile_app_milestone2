import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:patient_data_mobile_app_milestone2/screens/dashboard.dart';

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

    final String apiUrl = 'http://localhost:3000/patients/6602216b19457ef51270c029/tests';

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
                    return 'Please enter heartbeat rate of the patient!';
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()){
                        _formKey.currentState!.save();
                        _addClinicalData();
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => const DashboardScreen(),),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

Future<void> _addClinicalData() async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        // headers: {
        //   "Access-Control-Allow-Origin": "*",
        //   'Content-Type': 'application/json',
        //   'Accept': '*/*'
        // },
        body: jsonEncode(<String, dynamic>{
          'patientID': _patient.patientID,
          'date': _patient.date,
          'bloodPressure': _patient.bloodPressure,
          'respiratoryRate': _patient.respiratoryRate,
          'bloodOxygenlevel': _patient.bloodOxygenLevel,
          'heartbeatRate': _patient.heartbeatRate,
        }),
      );

      if (response.statusCode == 201) {
        // Successful POST request, handle the response here
        final responseData = jsonDecode(response.body);
        print(responseData);
        print(_patient.patientID);
      } else {
        // If the server returns an error response, throw an exception
        throw Exception('Failed to post data');
      }
    } catch (e) {
      print("excepion");
      print(e);
    }
  }
}