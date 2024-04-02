import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:patient_data_mobile_app_milestone2/screens/dashboard.dart';
import 'package:patient_data_mobile_app_milestone2/screens/newClinicalData.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  group('NewClinicalData Widget Test', () {
    late MockClient client;

    setUp(() {
      client = MockClient();
    });

    testWidgets('Tap on Submit button with valid input performs data submission', (WidgetTester tester) async {
      // Mock a successful data submission response
      when(client.post(
        Uri.parse('http://localhost:3000/patients/6602216b19457ef51270c029/tests'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response('{"success": true}', 201));

      await tester.pumpWidget(MaterialApp(
        home: NewClinicalData(),
      ));

      // Enter valid patient ID, date, blood pressure, respiratory rate, blood oxygen level, and heartbeat rate
      await tester.enterText(find.byKey(const Key('patientIDField')), '123456');
      await tester.enterText(find.byKey(const Key('dateField')), '2022-04-01');
      await tester.enterText(find.byKey(const Key('bloodPressureField')), '120/80');
      await tester.enterText(find.byKey(const Key('respiratoryRateField')), '18');
      await tester.enterText(find.byKey(const Key('bloodOxygenLevelField')), '98');
      await tester.enterText(find.byKey(const Key('heartbeatRateField')), '72');

      // Tap the Submit button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Verify that the DashboardScreen is pushed onto the navigator stack after successful data submission
      expect(find.byType(DashboardScreen), findsOneWidget);
    });

    testWidgets('Tap on Submit button with invalid input does not perform data submission', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: NewClinicalData(),
      ));

      // Leave patient ID field empty
      await tester.enterText(find.byKey(const Key('dateField')), '2022-04-01');
      await tester.enterText(find.byKey(const Key('bloodPressureField')), '120/80');
      await tester.enterText(find.byKey(const Key('respiratoryRateField')), '18');
      await tester.enterText(find.byKey(const Key('bloodOxygenLevelField')), '98');
      await tester.enterText(find.byKey(const Key('heartbeatRateField')), '72');

      // Tap the Submit button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Verify that data submission does not occur when input is invalid
      verifyNever(client.post(
        Uri.parse('http://localhost:3000/patients/6602216b19457ef51270c029/tests'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      ));
    });
  });
}
