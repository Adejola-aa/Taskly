import 'package:flutter/material.dart';

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

          const SizedBox(height: 30),

          Text(
            title,
            textAlign: TextAlign.center,
            style: theme.displayLarge!.copyWith(fontSize: 35),
          ),

          const SizedBox(height: 16),

          Text(subtitle, textAlign: TextAlign.center, style: theme.titleLarge),
        ],
      ),
    );
  }
}
