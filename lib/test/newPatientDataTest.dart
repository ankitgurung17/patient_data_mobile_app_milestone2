import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:patient_data_mobile_app_milestone2/screens/dashboard.dart';
import 'package:patient_data_mobile_app_milestone2/screens/newpatientData.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  group('NewpatientData Widget Test', () {
    late MockClient client;

    setUp(() {
      client = MockClient();
    });

    testWidgets('Tap on Submit button with valid input performs data submission', (WidgetTester tester) async {
      // Mock a successful data submission response
      when(client.post(
        Uri.parse('http://localhost:3000/patients'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response('{"success": true}', 201));

      await tester.pumpWidget(MaterialApp(
        home: NewpatientData(),
      ));

      // Enter valid patient data
      await tester.enterText(find.byKey(const Key('firstNameField')), 'John');
      await tester.enterText(find.byKey(const Key('lastNameField')), 'Doe');
      await tester.enterText(find.byKey(const Key('phoneNumberField')), '1234567890');
      await tester.enterText(find.byKey(const Key('emailAddressField')), 'john.doe@example.com');
      await tester.enterText(find.byKey(const Key('dateOfBirthField')), '1990-01-01');
      await tester.enterText(find.byKey(const Key('addressField')), '123 Main St');
      await tester.enterText(find.byKey(const Key('maritalField')), 'Single');

      // Tap the Submit button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Verify that the DashboardScreen is pushed onto the navigator stack after successful data submission
      expect(find.byType(DashboardScreen), findsOneWidget);
    });

    testWidgets('Tap on Submit button with invalid input does not perform data submission', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: NewpatientData(),
      ));

      // Leave first name field empty
      await tester.enterText(find.byKey(const Key('lastNameField')), 'Doe');

      // Tap the Submit button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Verify that data submission does not occur when input is invalid
      verifyNever(client.post(
        Uri.parse('http://localhost:3000/patients'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      ));
    });
  });
}