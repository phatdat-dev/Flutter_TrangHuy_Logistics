import 'package:flutter/material.dart';
import 'package:flutter_core_datz/flutter_core_datz.dart';

import '../../../generated/assets.gen.dart';
import '../../../routes/app_router.dart';
import '../../authentication/shared/widgets/text_register_widget.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _numPages = 3;

  List<Map<String, dynamic>> onboardingData = [
    {
      'title': 'Quick Delivery At Your Doorstep',
      'description': 'Enjoy quick pick-up and delivery to your destination',
      'image': Assets.svg.inNoTimePana,
    },
    {
      'title': 'Flexible Payment',
      'description': 'Different modes of payment either before and after delivery without stress',
      'image': Assets.svg.documentsRafiki,
    },
    {
      'title': 'Real-time Tracking',
      'description': 'Track your packages/items from the comfort of your home till final destination',
      'image': Assets.svg.startupLifeRafiki,
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    if (_currentPage < _numPages - 1) {
      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _onSkipPressed() {
    _pageController.jumpToPage(_numPages - 1);
  }

  void _onSignUpPressed() => const RegisterRoute().go(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Main content
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemCount: _numPages,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image placeholder
                        Container(
                          height: 300,
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 40),
                          child: HelperWidget.imageWidget(onboardingData[index]['image'], fit: BoxFit.contain),
                        ),

                        // Title
                        Text(
                          onboardingData[index]['title'],
                          style: TextStyle(color: Colors.blue[600], fontSize: 24, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),

                        // Description
                        Text(
                          onboardingData[index]['description'],
                          style: const TextStyle(fontSize: 16, color: Colors.black87),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 40),

                        // Pagination dots
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            _numPages,
                            (i) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(shape: BoxShape.circle, color: i == _currentPage ? Colors.blue[600] : Colors.grey[300]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Bottom buttons
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 75),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child:
                    _currentPage == _numPages - 1
                        ? Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: FilledButton(onPressed: _onSignUpPressed, child: const Text('Sign Up', style: TextStyle(fontSize: 16))),
                            ),
                            const SizedBox(height: 16),
                            const TextRegisterWidget(),
                          ],
                        )
                        : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 80,
                              height: 40,
                              child: OutlinedButton(
                                onPressed: _onSkipPressed,
                                style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.blue)),
                                child: const Text('Skip'),
                              ),
                            ),
                            SizedBox(
                              width: 80,
                              height: 40,
                              child: FilledButton(
                                onPressed: _onNextPressed,
                                style: FilledButton.styleFrom(padding: EdgeInsets.zero),
                                child: const Text('Next'),
                              ),
                            ),
                          ],
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
