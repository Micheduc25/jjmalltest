import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  List<String> categoryImages = [
    "fruits_purple.png",
    "mushroom_purple.png",
    "tea_purple.png",
    "rice_pot.png"
  ];

  List<Map<String, dynamic>> latestProducts = [
    {
      "id": 1,
      "title": "Orange",
      "price": 6.7,
      "image": "orange.png",
      "isFavorite": true
    },
    {
      "id": 2,
      "title": "Garlic",
      "price": 6.7,
      "image": "garlic.png",
      "isFavorite": false
    },
    {
      "id": 3,
      "title": "Broccoli",
      "price": 6.7,
      "image": "celeri.png",
      "isFavorite": false
    },
    {
      "id": 4,
      "title": "Red Onion",
      "price": 6.7,
      "image": "onions.png",
      "isFavorite": true
    },
    {
      "id": 5,
      "title": "Banana",
      "price": 6.7,
      "image": "banana.png",
      "isFavorite": false
    },
    {
      "id": 6,
      "title": "Tomato",
      "price": 6.7,
      "image": "tomato.png",
      "isFavorite": false
    },
    {
      "id": 7,
      "title": "Potato",
      "price": 6.7,
      "image": "potato.png",
      "isFavorite": true
    },
    {
      "id": 8,
      "title": "Cabbage",
      "price": 6.7,
      "image": "cabbage.png",
      "isFavorite": true
    },
  ];
}
