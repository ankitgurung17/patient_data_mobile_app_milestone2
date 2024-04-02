import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patient_data_mobile_app_milestone2/screens/dashboard.dart';
import 'package:patient_data_mobile_app_milestone2/screens/loginScreen.dart';
import 'package:patient_data_mobile_app_milestone2/screens/registerScreen.dart';

void main() {
  group('LoginScreen Widget Test', () {
    testWidgets('Tap on Sign In button navigates to DashboardScreen', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginScreen(),
      ));

      // Find the Sign In button and tap it
      await tester.tap(find.widgetWithText(ElevatedButton, 'Sign In'));
      await tester.pumpAndSettle();

      // Verify that DashboardScreen is pushed onto the navigator stack
      expect(find.byType(DashboardScreen), findsOneWidget);
    });

    testWidgets('Tap on Register Here button navigates to RegisterScreen', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginScreen(),
      ));

      // Find the Register Here button and tap it
      await tester.tap(find.text('Register Here'));
      await tester.pumpAndSettle();

      // Verify that RegisterScreen is pushed onto the navigator stack
      expect(find.byType(RegisterScreen), findsOneWidget);
    });
  });
}
