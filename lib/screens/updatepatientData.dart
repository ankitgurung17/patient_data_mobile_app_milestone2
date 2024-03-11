import 'package:flutter/material.dart';

class Patient {
  String patientID = '';
  String firstName = '';
  String lastName = '';
  DateTime? dateOfBirth;
  String gender = '';
  String phoneNumber = '';
  String emailAddress = '';
  String address = '';
}

class UpdatePatientData extends StatefulWidget {
  const UpdatePatientData({Key? key}) : super(key: key);

  @override
  State<UpdatePatientData> createState() => _UpdatePatientDataState();
}

class _UpdatePatientDataState extends State<UpdatePatientData> {
  final _formKey = GlobalKey<FormState>();
  final Patient _patient = Patient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Data Update'),
      ),
      body: Center( // Center vertically
        child: Padding(
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
                  decoration: const InputDecoration(labelText: 'First Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the first name!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _patient.firstName = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Last Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the last name!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _patient.lastName = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Date of Birth'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the date of birth!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _patient.dateOfBirth = DateTime.parse(value!);
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Gender'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the gender!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _patient.gender = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the phone number!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _patient.phoneNumber = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the email address!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _patient.emailAddress = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the address!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _patient.address = value!;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        print(_patient.patientID);
                        print(_patient.firstName);
                        print(_patient.lastName);
                        print(_patient.dateOfBirth);
                        print(_patient.gender);
                        print(_patient.phoneNumber);
                        print(_patient.emailAddress);
                        print(_patient.address);
                      }
                    },
                    child: const Text('Update'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

