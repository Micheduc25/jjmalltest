import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/signup_controller.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  static const String routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignupController(),
      builder: (context, child) {
        final signupProvider =
            Provider.of<SignupController>(context, listen: false);

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
                      'assets/images/variety.png',
                      // height: MediaQuery.of(context).size.height,
                      fit: BoxFit.fitWidth,
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                    child:

                        // login form here
                        Form(
                            key: signupProvider.formKey,
                            autovalidateMode: signupProvider.validateMode,
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Create an account",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge),
                                        IconButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            iconSize: 30,
                                            icon: Icon(
                                              Icons.cancel,
                                              color: Colors.black,
                                            ))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            controller: signupProvider
                                                .firstNameController,
                                            decoration: const InputDecoration(
                                              labelText: 'First Name',
                                            ),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.trim().isEmpty) {
                                                return 'Please enter your first name';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 30),
                                        Expanded(
                                          child: TextFormField(
                                            controller: signupProvider
                                                .lastNameController,
                                            decoration: const InputDecoration(
                                              labelText: 'Last Name',
                                            ),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.trim().isEmpty) {
                                                return 'Please enter your first name';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    TextFormField(
                                      controller:
                                          signupProvider.emailController,
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
                                    Consumer<SignupController>(
                                      builder:
                                          (context, signupProvider, child) {
                                        return TextFormField(
                                          validator: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return 'Please enter your password';
                                            }
                                            return null;
                                          },
                                          obscureText:
                                              !signupProvider.showPassword,
                                          decoration: InputDecoration(
                                              labelText: 'Password',
                                              hintText: "Enter your password",
                                              suffixIcon: IconButton(
                                                  onPressed: () {
                                                    signupProvider
                                                        .togglePassword();
                                                  },
                                                  icon: Icon(signupProvider
                                                          .showPassword
                                                      ? Icons.visibility
                                                      : Icons.visibility_off))),
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                          text:
                                              "By tapping Sign up you accept all ",
                                          children: [
                                            TextSpan(
                                                text: "terms ",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        // Navigate to terms
                                                      }),
                                            TextSpan(text: "and "),
                                            TextSpan(
                                                text: "conditions",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        // Navigate to conditions
                                                      })
                                          ]),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 55,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          signupProvider.signup(context);
                                        },
                                        child: Text("CREATE AN ACCOUNT"))
                                  ],
                                ),
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
