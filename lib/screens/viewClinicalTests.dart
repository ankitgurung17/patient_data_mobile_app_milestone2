import 'package:flutter/material.dart';

class ClinicalTests extends StatelessWidget {
  final Map<String, dynamic> patient;

  const ClinicalTests({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Clinical Tests',
          style: TextStyle(color: Color.fromARGB(255, 68, 156, 228)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('ID', patient['_id']),
              _buildDetailRow('Patient ID', '6602216b19457ef51270c029'),
              _buildDetailRow('Test Date', patient['date']),
              _buildDetailRow('Blood Pressure', patient['bloodPressure']),
              _buildDetailRow('Respiratory Rate', patient['respiratoryRate']),
              _buildDetailRow(
                  'Blood Oxygen Level', patient['bloodOxygenlevel']),
              _buildDetailRow('Hearbeat Rate', patient['heartbeatRate']),
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
