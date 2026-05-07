import 'package:flutter/material.dart';

class OnboardingIndicator extends StatelessWidget {
  final int currentIndex;
  final int length;

  const OnboardingIndicator({
    super.key,
    required this.currentIndex,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) {
        final isActive = index == currentIndex;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 4, // 👈 thin line
          width: isActive ? 28 : 12, // 👈 active is longer
          decoration: BoxDecoration(
            color: isActive ? Colors.black : Colors.grey.shade400,
            borderRadius: BorderRadius.circular(20), // 👈 smooth pill shape
          ),
        );
      }),
    );
  }
}
