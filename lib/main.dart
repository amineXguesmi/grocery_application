import 'package:flutter/material.dart';

import 'splash_screen.dart';
import 'ui/screens/bording_screen/bording_screen.dart';
import 'ui/screens/home_screens/home_screen.dart';
import 'ui/screens/sign_screens/signin/login_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnBordingScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
    ),
  );
}
