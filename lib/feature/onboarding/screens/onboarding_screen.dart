import 'package:flutter/material.dart';
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

  final List<Map<String, String>> pages = [
    {
      "title": "Taskly",
      "subtitle": "Organize your tasks.\nAchieve more every day.",
      "image": "assets/images/auth_illustration.png",
    },
    {
      "title": "Stay Productive",
      "subtitle": "Manage your daily tasks\nwith ease and focus.",
      "image": "assets/images/auth_illustration.png",
    },
    {
      "title": "Never Miss a Task",
      "subtitle": "Track deadlines and stay\non top of your schedule.",
      "image": "assets/images/auth_illustration.png",
    },
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

  void onPageChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void nextPage() {
    if (_currentIndex == pages.length - 1) {
      goToHome();
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void skip() {
    _pageController.animateToPage(
      pages.length - 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
    );
  }

  void goToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const Placeholder(),
      ), // HomeScreen later
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 148, 30, 227),
                Color.fromARGB(255, 70, 19, 164),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              // SKIP BUTTON
              Align(
                alignment: Alignment.topRight,
                child: TextButton(onPressed: skip, child: const Text("Skip")),
              ),

              // PAGES
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
                      title: page["title"]!,
                      subtitle: page["subtitle"]!,
                      image: page["image"]!,
                    );
                  },
                ),
              ),

              const SizedBox(height: 10),

              // INDICATOR
              OnboardingIndicator(
                currentIndex: _currentIndex,
                length: pages.length,
              ),

              const SizedBox(height: 20),

              // BUTTON
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: nextPage,
                    child: Text(
                      _currentIndex == pages.length - 1
                          ? "Get Started"
                          : "Next",
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
