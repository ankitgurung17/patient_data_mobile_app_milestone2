import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  Future<void> _addNewPatient() async {
    final String apiUrl = 'https://your-api-endpoint.com/add-patient';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'firstName': _patient.firstName,
          'lastName': _patient.lastName,
          'phoneNumber': _patient.phoneNumber,
          'emailAddress': _patient.emailAddress,
          'dateOfBirth': _patient.dateOfBirth.toString(),
          'address': _patient.address,
          'marital': _patient.marital,
          'gender': _patient.gender,
        }),
      );

      if (response.statusCode == 200) {
        // Patient added successfully, show success message
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Success'),
              content: const Text('Patient added successfully.'),
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
        // Handle unsuccessful patient addition
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Failed to add patient. Please try again.'),
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
                    // Other form fields...
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          _addNewPatient(); // Call the method to add patient
                        }
                      },
                      child: const Text('Add New Patient'),
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
