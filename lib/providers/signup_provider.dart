import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jjmalltest/screens/navbar_screen.dart';

class SignupProvider with ChangeNotifier {
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode validateMode = AutovalidateMode.disabled;
  bool showPassword = false;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void togglePassword() {
    showPassword = !showPassword;
    print(showPassword);
    notifyListeners();
  }

  Future<void> signup(BuildContext context) async {
    // unfocus the current focus
    FocusScope.of(context).unfocus();

    // validate the form
    if (formKey.currentState != null && !formKey.currentState!.validate()) {
      validateMode = AutovalidateMode.always;
      notifyListeners();
      return;
    }

    Fluttertoast.showToast(msg: "Welcome back");
    Navigator.of(context).pushNamed(NavBarScreen.routeName);
  }
}
