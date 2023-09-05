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
      child: LayoutBuilder(builder: (context, constraints) {
        return Card(
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      "assets/images/" + image,
                      height: constraints.maxHeight * 0.65,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.3,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("\$" + price.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
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
                          ),
                        ],
                      ),
                    ),
                  )
                ],
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
        );
      }),
    );
  }
}
