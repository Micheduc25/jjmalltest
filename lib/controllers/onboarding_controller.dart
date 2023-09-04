import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_controller.dart';

class OnboardingController with ChangeNotifier {
  OnboardingController(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      await Provider.of<AuthController>(context, listen: false)
          .initializeAuth(context);

      toggleOnboarding();
    });

    _pageController.addListener(() {
      if ((_pageController.page?.round() ?? 0) != currentPage) {
        Future.delayed(Duration(milliseconds: 50), () {
          currentPage = _pageController.page?.round() ?? 0;
          notifyListeners();
        });
      }
    });
  }

  bool showOnboarding = false;
  PageController _pageController = PageController(initialPage: 0);

  int currentPage = 0;

  List<Map<String, dynamic>> onboardingData = [
    {
      'title': 'Welcome to Fresh Fruits',
      'subtitle': 'Grocery application',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
      'image': 'onboarding1.png',
    },
    {
      'title': 'We provide best quality Fruits to your family',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed ',
      'image': 'onboarding2.png',
    },
    {
      'title': 'Fast and responsibily delivery by our courir ',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ',
      'image': 'delivery.png',
    },
  ];

  PageController get pageController => _pageController;

  int get activePage {
    if (_pageController.positions.isEmpty) return 0;
    return _pageController.page?.round() ?? 0;
  }

  void nextPage() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  void prevPage() {
    _pageController.previousPage(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  void toggleOnboarding() {
    showOnboarding = !showOnboarding;
    notifyListeners();
  }
}
