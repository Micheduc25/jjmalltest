import 'package:flutter/material.dart';
import 'package:jjmalltest/screens/auth/login.dart';
import 'package:jjmalltest/screens/auth/signup.dart';

class OnboardingProvider with ChangeNotifier {
  OnboardingProvider(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushNamed(SignupScreen.routeName);
    });
  }
}
