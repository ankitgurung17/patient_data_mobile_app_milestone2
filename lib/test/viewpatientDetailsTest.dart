import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patient_data_mobile_app_milestone2/screens/viewpatientDetails.dart';

void main() {
  testWidgets('PatientDetails Widget Test', (WidgetTester tester) async {
    final Map<String, dynamic> patient = {
      'id': '12345',
      'firstName': 'John',
      'lastName': 'Doe',
      'phoneNumber': '1234567890',
      'emailAddress': 'john.doe@example.com',
      'dateOfBirth': '1990-01-01',
      'address': '123 Main St',
      'marital': 'Single',
      'gender': 'Male',
    };

    await tester.pumpWidget(MaterialApp(
      home: PatientDetails(patient: patient),
    ));

    // Verify that all patient details are displayed correctly
    expect(find.text('ID:'), findsOneWidget);
    expect(find.text('12345'), findsOneWidget);
    expect(find.text('First Name:'), findsOneWidget);
    expect(find.text('John'), findsOneWidget);
    expect(find.text('Last Name:'), findsOneWidget);
    expect(find.text('Doe'), findsOneWidget);
    expect(find.text('Phone Number:'), findsOneWidget);
    expect(find.text('1234567890'), findsOneWidget);
    expect(find.text('Email Address:'), findsOneWidget);
    expect(find.text('john.doe@example.com'), findsOneWidget);
    expect(find.text('Date of Birth:'), findsOneWidget);
    expect(find.text('1990-01-01'), findsOneWidget);
    expect(find.text('Address:'), findsOneWidget);
    expect(find.text('123 Main St'), findsOneWidget);
    expect(find.text('Marital Status:'), findsOneWidget);
    expect(find.text('Single'), findsOneWidget);
    expect(find.text('Gender:'), findsOneWidget);
    expect(find.text('Male'), findsOneWidget);
  });
}