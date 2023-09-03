import 'package:flutter/material.dart';
import 'package:jjmalltest/models/category.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> categoriesList = [
    Category(name: "Fruits", id: 1, image: "fruits.png"),
    Category(name: "Vegetables", id: 2, image: "fruit_basket.png"),
    Category(name: "Mushroom", id: 3, image: "mushroom.png"),
    Category(name: "Dairy", id: 4, image: "tea.png"),
    Category(name: "Oats", id: 5, image: "rice_pot.png"),
    Category(name: "Bread", id: 6, image: "pancakes.png"),
    Category(name: "Rice", id: 7, image: "rice_bowl.png"),
    Category(name: "Egg", id: 8, image: "egg_basket.png"),
  ];
}
