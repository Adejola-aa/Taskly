import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:taskly/firebase_options.dart';
import 'package:taskly/feature/onboarding/screens/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
