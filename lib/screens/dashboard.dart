import 'package:flutter/material.dart';
import 'package:patient_data_mobile_app_milestone2/screens/newClinicalData.dart';
import 'package:patient_data_mobile_app_milestone2/screens/newPatientData.dart';
import 'package:patient_data_mobile_app_milestone2/screens/updateClinicalData.dart';
import 'package:patient_data_mobile_app_milestone2/screens/updatepatientData.dart';
import 'package:patient_data_mobile_app_milestone2/screens/viewClinicalData.dart';
import 'package:patient_data_mobile_app_milestone2/screens/viewPatientsData.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(
              bottom: 8.0), // Adjust the bottom padding as needed
          child: Text(
            'Dashboard',
            style: TextStyle(color: Color.fromARGB(255, 68, 156, 228)),
          ),
        ),
      ),
      body: Container(
        color: Colors.black, // Set background color to black for dark mode
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'gallery/patientInfo.png',
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
                child: const Text('Patient Data'),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'gallery/Clinicalpatient.png',
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ClinicalDataScreen(),
                    ),
                  );
                },
                child: const Text('Clinical Data'),
              ),
            ],
          ),
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
        title: const Text(
          'Patient Data',
          style: TextStyle(color: Color.fromARGB(255, 68, 156, 228)),
        ),
      ),
      body: Container(
        color: Colors.black, // Set background color to black for dark mode
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'gallery/patient.png',
                height: 100,
                width: 100,
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewpatientData()),
                  );
                },
                child: const Text('New Patient'),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'gallery/updatePatient.png',
                height: 100,
                width: 100,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UpdatePatientData()),
                  );
                },
                child: const Text('Update Patient'),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'gallery/viewPatient.png',
                height: 100,
                width: 100,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PatientsData()),
                  );
                },
                child: const Text('View Patients'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClinicalDataScreen extends StatelessWidget {
  const ClinicalDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Clinical Data',
          style: TextStyle(color: Color.fromARGB(255, 68, 156, 228)),
        ),
      ),
      body: Container(
        color: Colors.black, // Set background color to black for dark mode
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'gallery/ClinicalDataadd.png',
                height: 100,
                width: 100,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewClinicalData()),
                  );
                },
                child: const Text('New Clinical Data'),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'gallery/updateClinicalData.png',
                height: 100,
                width: 100,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UpdateClinicalData()),
                  );
                },
                child: const Text('Update Clinical Data'),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'gallery/view.png',
                height: 70,
                width: 100,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ClinicalData()),
                  );
                },
                child: const Text('View Clinical Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
