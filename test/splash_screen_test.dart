import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:urbanhub_task/screens/splash_screen.dart';
import 'package:urbanhub_task/routes/app_routes.dart';

void main() {
  testWidgets('SplashScreen renders Finlot logo and background', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(routes: AppRoutes.routes, initialRoute: AppRoutes.splash),
    );

    expect(find.byType(FinlotSplashBackground), findsOneWidget);

    expect(find.byType(Image), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 1000));

    await tester.pumpAndSettle(const Duration(milliseconds: 3000));

    expect(find.text('Create Your Pool'), findsOneWidget);
  });
}
