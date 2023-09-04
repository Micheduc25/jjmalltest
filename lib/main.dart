import 'package:flutter/material.dart';
import 'package:jjmalltest/controllers/auth_controller.dart';
import 'package:jjmalltest/screens/auth/login.dart';
import 'package:jjmalltest/screens/auth/signup.dart';
import 'package:jjmalltest/screens/navbar_screen.dart';
import 'package:jjmalltest/screens/onboarding.dart';
import 'package:jjmalltest/screens/order_success.dart';
import 'package:jjmalltest/screens/product_details.dart';
import 'package:jjmalltest/utils/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<AuthController>(
    create: (_) => AuthController(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fresh Fruits',
      theme: myTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: OnboardingScreen.routeName,
      routes: {
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        SignupScreen.routeName: (context) => const SignupScreen(),
        NavBarScreen.routeName: (context) => const NavBarScreen(),
        OrderSuccessScreen.routeName: (context) => const OrderSuccessScreen(),
        ProductDetailsScreen.routeName: (context) =>
            const ProductDetailsScreen(),
      },
    );
  }
}
