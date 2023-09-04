import 'package:flutter/material.dart';
import 'package:jjmalltest/models/favorite.dart';

class FavoritesController with ChangeNotifier {
  List<Favorite> favoriteItems = [
    Favorite(id: 1, name: 'Banana', price: 28.8, image: "placeholder.png"),
    Favorite(id: 2, name: 'Broccoli', price: 6.3, image: "celery2.png"),
    Favorite(id: 2, name: 'Oyster Mushroom', price: 2.7, image: "image2.png"),
  ];
}
