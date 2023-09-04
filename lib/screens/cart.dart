import 'package:flutter/material.dart';
import 'package:jjmalltest/components/cart_card.dart';
import 'package:provider/provider.dart';

import '../controllers/cart_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartController>(context);
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: PreferredSize(
            child: AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 90,
              elevation: 16,
              surfaceTintColor: Colors.transparent,
              title: Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 20),
                child: Text("Shopping Cart"),
              ),
              bottom: PreferredSize(
                  child: Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0XFFF4F4F4),
                  ),
                  preferredSize: Size.fromHeight(2)),
            ),
            preferredSize: Size.fromHeight(100.0)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView.separated(
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const SizedBox(
                    height: 0,
                  );
                }
                final item = cartProvider.cartItems[index - 1];
                return Consumer<CartController>(
                  builder: (context, cartProvider, child) {
                    return CartCard(
                      item: item,
                      onDecrement: () => cartProvider.decrementAmount(item),
                      onIncrement: () => cartProvider.incrementAmount(item),
                    );
                  },
                );
              },
              separatorBuilder: (context, index) {
                if (index == 0) {
                  return const SizedBox(
                    height: 15,
                  );
                }
                return const SizedBox(
                  height: 30,
                );
              },
              itemCount: cartProvider.cartItems.length + 1),
        ),
        bottomSheet: BottomSheet(
            onClosing: () {},
            backgroundColor: Theme.of(context).colorScheme.surface,
            showDragHandle: false,
            enableDrag: false,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Consumer<CartController>(
                    builder: (context, cartProvider, child) {
                      return Text(
                        "Total \$${cartProvider.calculateTotal().toStringAsFixed(2)}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            minimumSize: Size(
                              double.infinity,
                              45,
                            ),
                            maximumSize: Size(
                              double.infinity,
                              45,
                            )),
                        onPressed: () {
                          cartProvider.placeOrder(context);
                        },
                        child: Provider.of<CartController>(context).isLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                              )
                            : Text("Place Order".toUpperCase())),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            }));
  }
}
