import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patient_data_mobile_app_milestone2/screens/viewClinicalData.dart';
import 'package:patient_data_mobile_app_milestone2/screens/viewClinicalTests.dart';

void main() {
  testWidgets('ClinicalData Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ClinicalData(),
    ));

    // Wait for the mock HTTP response to be processed
    await tester.runAsync(() async {
      await Future.delayed(Duration.zero);

      // Verify that the patient data is displayed correctly
      expect(find.text('6602216b19457ef51270c029'), findsOneWidget);
      expect(find.text('Test Date: 2022-01-01'), findsOneWidget);
      expect(find.text('Test Date: 2022-01-02'), findsOneWidget);

      // Tap on the visibility icon to navigate to clinical tests screen
      await tester.tap(find.byIcon(Icons.visibility).first);
      await tester.pumpAndSettle();

      // Verify that the clinical tests screen is opened
      expect(find.byType(ClinicalTests), findsOneWidget);

      // Tap on the delete icon to show delete confirmation dialog
      await tester.tap(find.byIcon(Icons.delete).first);
      await tester.pumpAndSettle();

      // Verify that the delete confirmation dialog is shown
      expect(find.text('Confirm Delete'), findsOneWidget);

      // Tap on the delete button in the confirmation dialog
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      // Verify that the patient data is deleted from the list
      expect(find.text('Test Date: 2022-01-01'), findsNothing);
      expect(find.text('Test Date: 2022-01-02'), findsNothing);
    });
  });
}