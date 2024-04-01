import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:patient_data_mobile_app_milestone2/screens/loginScreen.dart';
import 'package:patient_data_mobile_app_milestone2/screens/registerScreen.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  group('RegisterScreen Widget Test', () {
    late MockClient client;

    setUp(() {
      client = MockClient();
    });

    testWidgets('Tap on Register button with valid input performs registration', (WidgetTester tester) async {
      // Mock a successful registration response
      when(client.post(
        Uri.parse('http://10.0.2.2:3000/auth/register'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response('{"success": true}', 200));

      await tester.pumpWidget(MaterialApp(
        home: RegisterScreen(),
      ));

      // Enter valid email, password, and confirm password
      await tester.enterText(find.byKey(const Key('emailField')), 'test@example.com');
      await tester.enterText(find.byKey(const Key('passwordField')), 'password');
      await tester.enterText(find.byKey(const Key('confirmPasswordField')), 'password');

      // Tap the Register button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Verify that the LoginScreen is pushed onto the navigator stack after successful registration
      expect(find.byType(LoginScreen), findsOneWidget);
    });

    testWidgets('Tap on Register button with invalid input does not perform registration', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: RegisterScreen(),
      ));

      // Leave email field empty
      await tester.enterText(find.byKey(const Key('passwordField')), 'password');
      await tester.enterText(find.byKey(const Key('confirmPasswordField')), 'password');

      // Tap the Register button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Verify that registration does not occur when input is invalid
      verifyNever(client.post(
        Uri.parse('http://10.0.2.2:3000/auth/register'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      ));
    });
  });
}