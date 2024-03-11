import 'package:flutter/material.dart';

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
                    onPressed: () {},
                    child: const Text('Add Test'),
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
