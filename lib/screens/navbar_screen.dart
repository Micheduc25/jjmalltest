import 'package:flutter/material.dart';
import 'package:jjmalltest/controllers/cart_controller.dart';
import 'package:jjmalltest/controllers/categories_controller.dart';
import 'package:jjmalltest/controllers/favorites_controller.dart';
import 'package:jjmalltest/controllers/home_controller.dart';
import 'package:provider/provider.dart';

import '../controllers/navbar_controller.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NavBarController()),
          ChangeNotifierProvider(create: (_) => HomeController()),
          ChangeNotifierProvider(create: (_) => CategoryController()),
          ChangeNotifierProvider(create: (_) => CartController()),
          ChangeNotifierProvider(create: (_) => FavoritesController())
        ],
        builder: (context, child) {
          return Consumer<NavBarController>(
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
