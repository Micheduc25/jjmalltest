import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jjmalltest/controllers/auth_controller.dart';
import 'package:jjmalltest/models/user_model.dart';
import 'package:jjmalltest/providers/auth_provider.dart';
import 'package:jjmalltest/screens/navbar_screen.dart';
import 'package:provider/provider.dart';

class LoginController with ChangeNotifier {
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode validateMode = AutovalidateMode.disabled;
  bool showPassword = false;

  TextEditingController emailController =
      TextEditingController(text: "251912121212");
  TextEditingController passwordController =
      TextEditingController(text: "12345678");

  // function to toggle password visibility
  void togglePassword() {
    showPassword = !showPassword;
    print(showPassword);
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    // unfocus the current focus
    FocusScope.of(context).unfocus();

    if (isLoading) return;

    // validate the form
    if (formKey.currentState != null && !formKey.currentState!.validate()) {
      validateMode = AutovalidateMode.always;
      notifyListeners();
      return;
    }

    final authProvider = AuthProvider();

    // attempt to login user
    try {
      isLoading = true;
      notifyListeners();

      final token = await authProvider.loginUser(
          emailController.text, passwordController.text);

      final userData = await authProvider.getUserData(token);
      final user = User.fromJson(userData);

      Provider.of<AuthController>(context, listen: false).setUser = user;
      await Provider.of<AuthController>(context, listen: false).setToken(token);

      Fluttertoast.showToast(msg: "Welcome back ${user.nickName}");
      Navigator.of(context).pushNamed(NavBarScreen.routeName);
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
