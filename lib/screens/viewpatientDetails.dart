import 'package:flutter/material.dart';

class PatientDetails extends StatelessWidget {
  final Map<String, dynamic> patient;

  const PatientDetails({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Patient Details',
          style: TextStyle(color: Color.fromARGB(255, 68, 156, 228)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('ID', patient['id']),
              _buildDetailRow('First Name', patient['firstName']),
              _buildDetailRow('Last Name', patient['lastName']),
              _buildDetailRow('Phone Number', patient['phoneNumber']),
              _buildDetailRow('Email Address', patient['emailAddress']),
              _buildDetailRow('Date of Birth', patient['dateOfBirth']),
              _buildDetailRow('Address', patient['address']),
              _buildDetailRow('Marital Status', patient['marital']),
              _buildDetailRow('Gender', patient['gender']),
            ],
          ),
        ),
      ),
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
