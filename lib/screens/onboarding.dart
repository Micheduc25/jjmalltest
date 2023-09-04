import 'package:flutter/material.dart';
import 'package:jjmalltest/screens/auth/login.dart';
import 'package:jjmalltest/screens/auth/signup.dart';
import 'package:provider/provider.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingController(context),
      builder: (context, child) {
        final onboardingProvider = Provider.of<OnboardingController>(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor:
                !Provider.of<OnboardingController>(context).showOnboarding
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).colorScheme.surface,
            body: !Provider.of<OnboardingController>(context).showOnboarding
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.sizeOf(context).height * 0.17),
                      child: Image.asset("assets/images/logo.png"),
                    ),
                  )
                : PageView(
                    controller: onboardingProvider.pageController,
                    children: [
                        OnboardingItem(
                          title: onboardingProvider.onboardingData[0]["title"],
                          activeIndex:
                              Provider.of<OnboardingController>(context)
                                  .currentPage,
                          subtitle: onboardingProvider.onboardingData[0]
                              ["subtitle"],
                          image: onboardingProvider.onboardingData[0]["image"],
                          index: 0,
                          description: onboardingProvider.onboardingData[0]
                              ["description"],
                          addTopPadding: true,
                          onNext: onboardingProvider.nextPage,
                          onNavigateBack: () {},
                        ),
                        OnboardingItem(
                          title: onboardingProvider.onboardingData[1]["title"],
                          activeIndex:
                              Provider.of<OnboardingController>(context)
                                  .currentPage,
                          subtitle: onboardingProvider.onboardingData[1]
                              ["subtitle"],
                          image: onboardingProvider.onboardingData[1]["image"],
                          index: 1,
                          description: onboardingProvider.onboardingData[1]
                              ["description"],
                          addTopPadding: false,
                          onNext: onboardingProvider.nextPage,
                          onNavigateBack: () {
                            onboardingProvider.prevPage();
                          },
                        ),
                        OnboardingItem(
                          title: onboardingProvider.onboardingData[2]["title"],
                          activeIndex:
                              Provider.of<OnboardingController>(context)
                                  .currentPage,
                          subtitle: onboardingProvider.onboardingData[2]
                              ["subtitle"],
                          image: onboardingProvider.onboardingData[2]["image"],
                          index: 1,
                          description: onboardingProvider.onboardingData[2]
                              ["description"],
                          addTopPadding: true,
                          topPadding: MediaQuery.sizeOf(context).height * 0.18,
                          onNavigateBack: () {
                            onboardingProvider.prevPage();
                          },
                          action: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.black),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(SignupScreen.routeName);
                                  },
                                  child: Text("CREATE AN ACCOUNT")),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      backgroundColor: Colors.white,
                                      side: BorderSide(
                                          color: Colors.black, width: 2)),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(LoginScreen.routeName);
                                  },
                                  child: Text("LOGIN"))
                            ],
                          ),
                        )
                      ]),
          ),
        );
      },
    );
  }
}

class OnboardingItem extends StatelessWidget {
  const OnboardingItem(
      {super.key,
      required this.title,
      required this.activeIndex,
      required this.image,
      required this.description,
      required this.index,
      this.subtitle,
      this.onNavigateBack,
      this.action,
      this.addTopPadding = false,
      this.topPadding,
      this.onNext});

  final String image;
  final String title;
  final String? subtitle;
  final String description;
  final int activeIndex;
  final int index;
  final Widget? action;
  final VoidCallback? onNext;
  final VoidCallback? onNavigateBack;
  final bool addTopPadding;
  final double? topPadding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Column(
          children: [
            if (addTopPadding)
              SizedBox(
                height: topPadding ?? MediaQuery.sizeOf(context).height * 0.25,
              ),
            Image.asset(
              "assets/images/" + image,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(
                    height: 20,
                  ),
                  if (subtitle != null)
                    Text(subtitle!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(description,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < 3; i++)
                        AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          width: 25,
                          height: 6,
                          margin: EdgeInsets.only(right: i != 2 ? 5 : 0),
                          decoration: BoxDecoration(
                              color: i == activeIndex
                                  ? Color(0XFF12B76A)
                                  : Color(0XFFF2F2F2),
                              borderRadius: BorderRadius.circular(50)),
                        )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  if (action != null)
                    Align(alignment: Alignment.bottomCenter, child: action!)
                  else
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                            onPressed: onNext, child: Text("NEXT")))
                ],
              ),
            )
          ],
        ),
        Positioned(
            top: 10,
            left: 10,
            child: IconButton(
                onPressed: onNavigateBack,
                icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Theme.of(context).colorScheme.secondary,
                )))
      ],
    );
  }
}
