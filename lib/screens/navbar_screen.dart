import 'package:flutter/material.dart';
import 'package:jjmalltest/providers/cart_provider.dart';
import 'package:jjmalltest/providers/categories_provider.dart';
import 'package:jjmalltest/providers/favorites_provider.dart';
import 'package:jjmalltest/providers/home_provider.dart';
import 'package:provider/provider.dart';

import '../providers/navbar_provider.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NavBarProvider()),
          ChangeNotifierProvider(create: (_) => HomeProvider()),
          ChangeNotifierProvider(create: (_) => CategoryProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => FavoritesProvider())
        ],
        builder: (context, child) {
          return Consumer<NavBarProvider>(
              builder: (context, navBarProvider, child) {
            return Scaffold(
              body: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: navBarProvider.currentChild,
              ),
              bottomNavigationBar: BottomNavigationBar(
                  currentIndex: navBarProvider.currentIndex,
                  showUnselectedLabels: false,
                  showSelectedLabels: false,
                  selectedItemColor: Theme.of(context).colorScheme.secondary,
                  unselectedItemColor: Theme.of(context).colorScheme.tertiary,
                  onTap: (index) {
                    navBarProvider.setCurrentIndex(index);
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/images/ic_home.png")),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon:
                          ImageIcon(AssetImage("assets/images/transfer 1.png")),
                      label: "Categories",
                    ),
                    BottomNavigationBarItem(
                      icon: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ImageIcon(AssetImage("assets/images/shopping.png")),
                          Positioned(
                              right: -5,
                              top: -5,
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    color: navBarProvider.currentIndex == 2
                                        ? Theme.of(context)
                                            .colorScheme
                                            .secondary
                                        : Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1,
                                    )),
                                child: Text(
                                  "3",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ))
                        ],
                      ),
                      label: "Details",
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(
                          AssetImage("assets/images/ic_wishlist.png")),
                      label: "Favorites",
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(
                          AssetImage("assets/images/ProfileIcon.png")),
                      label: "Profile",
                    ),
                  ]),
            );
          });
        });
  }
}
