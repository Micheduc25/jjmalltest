import 'package:flutter/material.dart';

class CategoryCardLG extends StatelessWidget {
  const CategoryCardLG(
      {super.key,
      required this.index,
      required this.title,
      required this.image});

  final String image;
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      // elevation: 10,
      // surfaceTintColor: Color(0XFFFBFBFB),
      margin: EdgeInsets.only(
          top: index == 0 || index == 1 ? 20 : 20,
          right: index.isEven ? 0 : 20,
          left: index.isOdd ? 0 : 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Color(0XFF000000).withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 9,
              offset: Offset(9, 0),
            )
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              fit: BoxFit.contain,
              height: 70,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: 0.8,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary))
          ],
        ),
      ),
    );
  }
}
