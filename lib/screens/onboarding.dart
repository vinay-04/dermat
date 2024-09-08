import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      svg: '''
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
  <circle cx="12" cy="12" r="10"></circle>
  <path d="M16 14c-1.5 2-4.5 2-6 0"></path>
  <line x1="9" y1="9" x2="9.01" y2="9"></line>
  <line x1="15" y1="9" x2="15.01" y2="9"></line>
  <path d="M12 17.5c2.49 0 4.5-2.01 4.5-4.5S14.49 8.5 12 8.5 7.5 10.51 7.5 13 9.51 17.5 12 17.5z"></path>
</svg>
''',
    ),
    OnboardingPage(
      title: 'Scan and Analyze',
      description:
          'Take a photo of your skin concern and get instant analysis.',
      svg: '''
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
  <rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect>
  <path d="M12 10a2 2 0 0 0-2-2"></path>
  <path d="M9 12h1a2 2 0 0 1 2 2"></path>
  <path d="M15 12h1a2 2 0 0 0 2-2"></path>
  <path d="M14 15a2 2 0 0 0-2 2"></path>
</svg>
''',
    ),
    OnboardingPage(
      title: 'Expert Advice',
      description: 'Connect with dermatologists for professional opinions.',
      svg: '''
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
  <circle cx="12" cy="12" r="10"></circle>
  <path d="M12 8v4"></path>
  <path d="M12 16h.01"></path>
  <path d="M12 7a3.5 3.5 0 0 1 3.5 3.5v.5a3.5 3.5 0 0 1-7 0v-.5A3.5 3.5 0 0 1 12 7z"></path>
</svg>
''',
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.string(page.svg, height: 300),
            // Image.asset(page.svg, height: 300),
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
  final String svg;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.svg,
  });
}
