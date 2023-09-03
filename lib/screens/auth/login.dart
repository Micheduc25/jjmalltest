import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/login_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(),
      builder: (context, child) {
        final loginProvider =
            Provider.of<LoginProvider>(context, listen: false);

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            body: Stack(
              children: [
                Positioned(
                    // alignment: Alignment.topCenter,
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/images/image.png',
                      // height: MediaQuery.of(context).size.height,
                      fit: BoxFit.fitWidth,
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.55,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                    child:

                        // login form here
                        Form(
                            key: loginProvider.formKey,
                            autovalidateMode: loginProvider.validateMode,
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Sign In",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  TextFormField(
                                    controller: loginProvider.emailController,
                                    decoration: const InputDecoration(
                                      labelText: 'Email',
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Please enter your email';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Consumer<LoginProvider>(
                                    builder: (context, loginProvider, child) {
                                      return TextFormField(
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return 'Please enter your password';
                                          }
                                          return null;
                                        },
                                        obscureText:
                                            !loginProvider.showPassword,
                                        decoration: InputDecoration(
                                            labelText: 'Password',
                                            hintText: "Enter your password",
                                            suffixIcon: IconButton(
                                                onPressed: () {
                                                  loginProvider
                                                      .togglePassword();
                                                },
                                                icon: Icon(loginProvider
                                                        .showPassword
                                                    ? Icons.visibility
                                                    : Icons.visibility_off))),
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 55,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        loginProvider.login(context);
                                      },
                                      child: Text("SIGN IN"))
                                ],
                              ),
                            )),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
