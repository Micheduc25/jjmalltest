import 'package:flutter/material.dart';
import 'package:jjmalltest/components/favorite_card.dart';
import 'package:provider/provider.dart';

import '../providers/favorites_provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: PreferredSize(
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Text("Favorites"),
          ),
          toolbarHeight: 80,
          bottom: PreferredSize(
              child: Divider(
                height: 1,
                thickness: 1,
                color: Color(0XFFF4F4F4),
              ),
              preferredSize: Size.fromHeight(2)),
        ),
        preferredSize: Size.fromHeight(95),
      ),
      body: ListView.separated(
          itemBuilder: ((context, index) {
            if (index == 0) {
              return const SizedBox(
                height: 20,
              );
            }

            final favorite = favoritesProvider.favoriteItems[index - 1];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: FavoriteCard(item: favorite),
            );
          }),
          separatorBuilder: ((context, index) {
            if (index == 0) {
              return const SizedBox(
                height: 0,
              );
            }

            return const SizedBox(
              height: 25,
            );
          }),
          itemCount: favoritesProvider.favoriteItems.length + 1),
    );
  }
}
