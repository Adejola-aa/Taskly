import 'package:flutter/material.dart';
import 'package:taskly/core/constants/colors.dart';
import 'package:taskly/core/constants/sizes.dart';

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
          height: 5,
          width: isActive ? 30 : 15,
          decoration: BoxDecoration(
            color: isActive ? AppColors.buttonPrimary : AppColors.buttonDisabled,
            borderRadius: BorderRadius.circular(AppSizes.radiusXl),
          ),
        );
      }),
    );
  }
}
