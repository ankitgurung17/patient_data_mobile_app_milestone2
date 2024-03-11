import 'package:flutter/material.dart';
import 'package:patient_data_mobile_app_milestone2/screens/newPatientData.dart';
import 'package:patient_data_mobile_app_milestone2/screens/updatepatientData.dart';
import 'package:patient_data_mobile_app_milestone2/screens/viewPatientsData.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'gallery/patientInfo.png', // Replace with your image asset
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PatientRecordScreen(),
                  ),
                );
              },
              child: const Text('Patient Info'),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'gallery/Clinicalpatient.png', // Replace with your image asset
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 20),
            /*ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ClinicalDataScreen(),
                  ),
                );
              },
              child: const Text('Patient Clinical Info'),
            ),*/
          ],
        ),
      ),
    );
  }
}

class PatientRecordScreen extends StatelessWidget {
  const PatientRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Patient Record'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddPatientRecord()),
                );
              },
              child: const Text('Add Patient Record'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UpdatePatientRecord()),
                );
                // Add functionality to update patient record
              },
              child: const Text('Update Patient Record'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PatientInfoTableScreen()),
                );
              },
              child: const Text('View Patient Record'),
            ),
          ],
        ),
      ),
    );
  }
}


