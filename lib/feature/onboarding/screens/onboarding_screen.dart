import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskly/config/router/routes.dart';
import 'package:taskly/core/constants/image_strings.dart';
import 'package:taskly/core/utils/app_preferences.dart';
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
      subtitle: 'Organize your tasks.\nAchieve more every day.',
      image: AppImages.onboarding1,
    ),
    const OnboardingModel(
      title: 'Stay Productive',
      subtitle: 'Manage your daily tasks\nwith ease and focus.',
      image: AppImages.onboarding2,
    ),
    const OnboardingModel(
      title: 'Never Miss a Task',
      subtitle: 'Track deadlines and stay\non top of your schedule.',
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

  void _getStarted() async {
    await AppPreferences.setOnboardingSeen();
    if (mounted) context.go(AppRoutes.logIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: _getStarted,
              child: Icon(Icons.close),
            ),
          ),
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
                  subtitle: page.subtitle,
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
                onPressed: () {
                  if (_currentIndex < pages.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    _getStarted();
                  }
                },
                child: Text(
                  _currentIndex == pages.length - 1 ? 'Get Started' : 'Next',
                  style: ,
                ),
              ),
            ),
          ),

          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
