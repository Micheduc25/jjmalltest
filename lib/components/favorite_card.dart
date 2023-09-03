import 'package:flutter/material.dart';
import 'package:jjmalltest/models/favorite.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({super.key, required this.item});

  final Favorite item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Row(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.name,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                          Icon(Icons.favorite, color: Color(0XFFFF2E6C)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "\$" + item.price.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                                height: 35,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Color(0XFFEFEFEF),
                                    borderRadius: BorderRadius.circular(18)),
                                child: Center(child: Text("Add to cart"))),
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
