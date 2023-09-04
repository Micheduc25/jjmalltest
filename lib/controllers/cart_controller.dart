import 'package:flutter/material.dart';
import 'package:jjmalltest/screens/order_success.dart';

import '../models/cart_item.dart';

class CartController with ChangeNotifier {
  List<CartItem> cartItems = [
    CartItem(
        id: 1,
        name: 'Banana',
        amount: 3,
        category: "Fruits",
        price: 28.8,
        image: "placeholder.png"),
    CartItem(
        id: 2,
        name: 'Broccoli',
        amount: 1,
        category: "Vegetables",
        price: 6.3,
        image: "celery2.png"),
    CartItem(
        id: 2,
        name: 'Oyster Mushroom',
        amount: 1,
        category: "Mushroom",
        price: 2.7,
        image: "image2.png"),
  ];

  bool isLoading = false;

  void incrementAmount(CartItem cartItem) {
    cartItem.amount++;
    notifyListeners();
  }

  void decrementAmount(CartItem cartItem) {
    if (cartItem.amount == 0) {
      return;
    }
    cartItem.amount--;

    notifyListeners();
  }

  double calculateTotal() {
    double total = 0;
    for (final item in cartItems) {
      total += item.amount * item.price;
    }

    return total;
  }

  Future<void> placeOrder(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 3));
    isLoading = false;
    notifyListeners();

    Navigator.of(context).pushNamed(OrderSuccessScreen.routeName);
  }
}
