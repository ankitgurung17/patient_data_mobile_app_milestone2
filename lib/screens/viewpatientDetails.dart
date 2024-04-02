import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PatientDetailsWebService extends StatefulWidget {
  final String patientId;

  const PatientDetailsWebService({Key? key, required this.patientId}) : super(key: key);

  @override
  _PatientDetailsWebServiceState createState() => _PatientDetailsWebServiceState();
}

class _PatientDetailsWebServiceState extends State<PatientDetailsWebService> {
  Map<String, dynamic>? patientData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPatientDetails();
  }

  Future<void> fetchPatientDetails() async {
    final apiUrl = 'http://your-server-url.com/patients/${widget.patientId}'; // Replace with your server URL
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        setState(() {
          patientData = jsonDecode(response.body);
          isLoading = false;
        });
      } else {
        print('Failed to fetch patient details');
        setState(() {
          isLoading = false;
        });
      }
    } catch (error) {
      print('Error: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Details'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : patientData != null
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetailRow('ID', patientData!['id']),
                      _buildDetailRow('First Name', patientData!['firstName']),
                      _buildDetailRow('Last Name', patientData!['lastName']),
                      _buildDetailRow('Phone Number', patientData!['phoneNumber']),
                      _buildDetailRow('Email Address', patientData!['emailAddress']),
                      _buildDetailRow('Date of Birth', patientData!['dateOfBirth']),
                      _buildDetailRow('Address', patientData!['address']),
                      _buildDetailRow('Marital Status', patientData!['marital']),
                      _buildDetailRow('Gender', patientData!['gender']),
                    ],
                  ),
                )
              : Center(child: Text('Patient details not found')),
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
