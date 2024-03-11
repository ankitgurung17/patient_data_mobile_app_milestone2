import 'package:flutter/material.dart';

class Patient {
  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  String emailAddress = '';
  DateTime? dateOfBirth;
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
      child: Center( // Center the content
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
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
                      _patient.dateOfBirth = DateTime.parse(value!);
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            print(_patient.firstName);
                            print(_patient.lastName);
                            print(_patient.phoneNumber);
                            print(_patient.emailAddress);
                            print(_patient.dateOfBirth);
                            print(_patient.address);
                            print(_patient.marital);
                            print(_patient.gender);
                          }
                        },
                        child: const Text('Add New Patient'),
                      ),
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
}

