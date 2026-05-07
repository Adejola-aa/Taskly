import 'package:flutter/material.dart';

import 'package:taskly/core/constants/image_strings.dart';
import 'package:taskly/feature/onboarding/model/onboarding_model.dart';
import 'package:taskly/feature/onboarding/widgets/onboarding_indicator.dart';
import 'package:taskly/feature/onboarding/widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  int _currentIndex = 0;

  final List<OnboardingModel> pages = [
    const OnboardingModel(
      title: 'Taskly',
      subtitile: 'Organize your tasks.\nAchieve more every day.',
      image: AppImages.onboarding1,
    ),
    const OnboardingModel(
      title: 'Stay Productive',
      subtitile: 'Manage your daily tasks\nwith ease and focus.',
      image: AppImages.onboarding2,
    ),
    const OnboardingModel(
      title: 'Never Miss a Task',
      subtitile: 'Track deadlines and stay\non top of your schedule.',
      image: AppImages.onboarding3,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void getStarted() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const Placeholder()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              itemCount: pages.length,
              itemBuilder: (context, index) {
                final page = pages[index];

                return OnboardingPage(
                  title: page.title,
                  subtitle: page.subtitile,
                  image: page.image,
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          OnboardingIndicator(
            currentIndex: _currentIndex,
            length: pages.length,
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: getStarted,
                child: Text("Get Started"),
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
