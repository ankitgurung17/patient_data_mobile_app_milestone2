import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:patient_data_mobile_app_milestone2/screens/dashboard.dart';

class Patient {
  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  String emailAddress = '';
  String dateOfBirth = '';
  String address = '';
  String marital = '';
  String gender = '';
}

class NewpatientData extends StatefulWidget {
  const NewpatientData({Key? key}) : super(key: key);

  @override
  State<NewpatientData> createState() => _NewpatientDataState();
}

class _NewpatientDataState extends State<NewpatientData> {
  final _formKey = GlobalKey<FormState>();
  final Patient _patient = Patient();

  final List<String> genderOptions = ['Male', 'Female', 'Other'];

  final String apiUrl = 'http://localhost:3000/patients';
  //final String apiUrl = 'http://127.0.0.1:3000/patients';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Patient',
          style: TextStyle(color: Color.fromARGB(255, 68, 156, 228)),
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Center(
          // Center the content
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'First Name'),
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
                      decoration:
                          const InputDecoration(labelText: 'Phone Number'),
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
                      decoration:
                          const InputDecoration(labelText: 'Email Address'),
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
                      decoration:
                          const InputDecoration(labelText: 'Date of Birth'),
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
                      decoration:
                          const InputDecoration(labelText: 'Marital Status'),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: ElevatedButton(
                  // onPressed: _postData,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // You can add logic here to save the patient record
                      // For now, let's print the patient information
                      _postData();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardScreen(),
                        ),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
            ),
          ),
        ),
      ),
    );
  }

  // adding patient info
  Future<void> _postData() async {
    try {
      final response = await http.post(
        // Uri.parse('http://localhost:3000/patients'),
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

      if (response.statusCode == 201) {
        // Successful POST request, handle the response here
        final responseData = jsonDecode(response.body);
        print(responseData);
        print(_patient.firstName);
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
