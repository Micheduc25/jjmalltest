import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jjmalltest/models/user_model.dart';
import 'package:jjmalltest/providers/auth_provider.dart';
import 'package:jjmalltest/screens/auth/login.dart';
import 'package:jjmalltest/screens/navbar_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController with ChangeNotifier {
  User? currentUser;

  String? token;

  bool isLoading = true;
  final AuthProvider authProvider = AuthProvider();

  AuthController() {}

  // function to fetch initial user data when app starts, provided user already logged in before
  Future<void> initializeAuth(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    token = prefs.getString('token');

    if (token != null) {
      try {
        final userdata = await authProvider.getUserData(token!);

        final user = User.fromJson(userdata);

        setUser = user;
        Navigator.of(context).pushReplacementNamed(NavBarScreen.routeName);
      } on Exception {
        Fluttertoast.showToast(msg: "Unable to get user data");
        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
      } finally {
        isLoading = false;
        notifyListeners();
      }
    } else {
      // display splash screen for 2 seconds
      await Future.delayed(Duration(seconds: 2));
    }
  }

  void set setUser(User user) {
    currentUser = user;
    notifyListeners();
  }

  Future<void> setToken(String token) async {
    this.token = token;

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("token", token);
    notifyListeners();
  }

  Future<void> getUser(String token) async {
    try {
      final data = authProvider.getUserData(token);
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: "$e");
    }
  }

  /// function to logout user
  Future<void> logoutUser(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    Navigator.of(context).pushNamedAndRemoveUntil(
        LoginScreen.routeName, (route) => route.isFirst);

    currentUser = null;
    token = null;

    Fluttertoast.showToast(msg: "Logged out successfully");
  }
}
