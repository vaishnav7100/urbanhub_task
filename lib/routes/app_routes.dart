import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/onboarding_screen.dart';
import '../screens/splash_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String home = '/home';

  static Map<String, WidgetBuilder> get routes => {
    splash: (context) => const SplashScreen(
      duration: Duration(seconds: 3),
      nextRoute: onboarding,
    ),
    onboarding: (context) => const OnboardingScreen(),
    home: (context) => const HomeScreen(),
  };
}
