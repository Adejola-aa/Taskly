import 'package:flutter/material.dart';
import 'package:taskly/feature/onboarding/screens/onboarding_screen.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 350, fit: BoxFit.contain),


          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OnboardingScreen(),
                ),
              );
            },
            child: Text('view all'),
          ),

          Text(title, textAlign: TextAlign.center, style: theme.displaySmall),

          const SizedBox(height: 15),

          Text(subtitle, textAlign: TextAlign.center, style: theme.bodyLarge),
        ],
      ),
    );
  }
}
