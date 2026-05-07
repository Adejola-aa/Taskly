import 'package:flutter/material.dart';
import 'package:taskly/feature/onboarding/screens/onboarding_screen.dart';
void main() {
  runApp(const TasklyApp());
}

class TasklyApp extends StatelessWidget {
  const TasklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: const OnboardingScreen());
  }
}
