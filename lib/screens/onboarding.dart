import 'package:flutter/material.dart';
import 'package:jjmalltest/providers/home_provider.dart';
import 'package:provider/provider.dart';

import '../providers/onboarding_provider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingProvider(context),
      builder: (context, child) {
        final onboardingProvider = Provider.of<OnboardingProvider>(context);
        return Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.sizeOf(context).height * 0.17),
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
        );
      },
    );
  }
}
