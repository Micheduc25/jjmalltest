import 'package:flutter/material.dart';
import 'package:jjmalltest/models/cart_item.dart';

class CartCard extends StatelessWidget {
  const CartCard(
      {super.key, required this.item, this.onIncrement, this.onDecrement});

  final CartItem item;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset("assets/images/" + item.image),
          ),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        item.category.toUpperCase(),
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        item.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "\$" + item.price.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 16),
                          ),
                          Container(
                            // padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Color(0XFFEFEFEF),
                                borderRadius: BorderRadius.circular(18)),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: onDecrement,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5.0),
                                      child: Icon(
                                        Icons.remove,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    item.amount.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  InkWell(
                                    onTap: onIncrement,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5.0),
                                      child: Icon(
                                        Icons.add,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                      ),
                                    ),
                                  )
                                ]),
                          )
                        ],
                      ),
                    ],
                  )))
        ],
      ),
    );
  }
}
