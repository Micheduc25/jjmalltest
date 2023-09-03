import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key,
      required this.image,
      required this.title,
      required this.price,
      this.onTap,
      this.isFavorite = false});

  final String image;

  final bool isFavorite;

  final String title;
  final double price;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 0,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/" + image,
                      height: 160,
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$" + price.toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      InkWell(
                          onTap: () {},
                          child: Text(
                            "Add to cart",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  )
                ],
              ),
            ),
            Positioned(
                top: 5,
                left: 5,
                child: Icon(
                  Icons.favorite,
                  color: isFavorite
                      ? Color(0XFFFF2E6C)
                      : Theme.of(context).colorScheme.tertiary,
                ))
          ],
        ),
      ),
    );
  }
}
