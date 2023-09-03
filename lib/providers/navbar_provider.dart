import 'package:flutter/material.dart';
import 'package:jjmalltest/screens/categories.dart';
import 'package:jjmalltest/screens/cart.dart';
import 'package:jjmalltest/screens/favorites.dart';
import 'package:jjmalltest/screens/home.dart';
import 'package:jjmalltest/screens/profile.dart';

class NavBarProvider with ChangeNotifier {
  List<Widget> _navBarItems = [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    FavoritesScreen(),
    ProfileScreen()
  ];

  int _currentIndex = 0;

  get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Widget get currentChild => _navBarItems[_currentIndex];
}
