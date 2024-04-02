import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Patient {
  String id = ''; 
  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  String emailAddress = '';
  String dateOfBirth = '';
  String address = '';
  String marital = '';
  String gender = '';
}

class UpdatePatientData extends StatefulWidget {
  const UpdatePatientData({Key? key}) : super(key: key);

  @override
  State<UpdatePatientData> createState() => _UpdatePatientDataState();
}

class _UpdatePatientDataState extends State<UpdatePatientData> {
  final _formKey = GlobalKey<FormState>();
  final Patient _patient = Patient();
  final List<String> genderOptions = ['Male', 'Female', 'Other'];
  final String apiUrl = 'http://localhost:3000/patients';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update Patient',
          style: TextStyle(color: Color.fromARGB(255, 68, 156, 228)),
        ),
      ),
      body: SingleChildScrollView(
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
                      return 'Please enter the patient ID!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _patient.id = value!;
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
                  decoration: const InputDecoration(labelText: 'Date of Birth'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the date of birth!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _patient.dateOfBirth = value!;
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
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Marital Status'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your marital status!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _patient.marital = value!;
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Gender',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Row(
                  children: genderOptions
                      .map(
                        (gender) => Row(
                          children: [
                            Radio(
                              value: gender,
                              groupValue: _patient.gender,
                              onChanged: (String? value) {
                                setState(() {
                                  _patient.gender = value!;
                                });
                              },
                            ),
                            Text(gender),
                          ],
                        ),
                      )
                      .toList(),
                ),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _updatePatient();
                    }
                  },
                  child: const Text('Update'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _updatePatient() async {
    try {
      final response = await http.put(
        Uri.parse('$apiUrl/${_patient.id}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'firstName': _patient.firstName,
          'lastName': _patient.lastName,
          'phoneNumber': _patient.phoneNumber,
          'emailAddress': _patient.emailAddress,
          'dateOfBirth': _patient.dateOfBirth,
          'address': _patient.address,
          'marital': _patient.marital,
          'gender': _patient.gender,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print(responseData);
        print('Patient updated successfully');
      } else {
        throw Exception('Failed to update patient: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception occurred: $e');
    }
  }
}
