import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _numPages = 3;

  List<OnboardingPage> pages = [
    OnboardingPage(
      title: 'Welcome to SkinCheck',
      description: 'Your personal skin health assistant.',
      image: 'assets/welcome.png',
    ),
    OnboardingPage(
      title: 'Scan and Analyze',
      description:
          'Take a photo of your skin concern and get instant analysis.',
      image: 'assets/scan.png',
    ),
    OnboardingPage(
      title: 'Expert Advice',
      description: 'Connect with dermatologists for professional opinions.',
      image: 'assets/expert.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _numPages,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return buildPage(pages[index]);
            },
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _numPages,
                    (index) => buildDot(index: index),
                  ),
                ),
                const SizedBox(height: 20),
                _currentPage == _numPages - 1
                    ? ElevatedButton(
                        onPressed: () => _completeOnboarding(context),
                        child: const Text('Get Started'),
                      )
                    : TextButton(
                        onPressed: () => _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        ),
                        child: const Text('Next'),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage(OnboardingPage page) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(page.image, height: 300),
            const SizedBox(height: 30),
            Text(
              page.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Text(
              page.description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDot({required int index}) {
    return Container(
      height: 10,
      width: 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? Colors.blue : Colors.grey,
      ),
    );
  }

  void _completeOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingComplete', true);
    Navigator.of(context).pushReplacementNamed('/login');
  }
}

class OnboardingPage {
  final String title;
  final String description;
  final String image;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.image,
  });
}
