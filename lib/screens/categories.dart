import 'package:flutter/material.dart';
import 'package:jjmalltest/components/category_card.dart';
import 'package:jjmalltest/providers/categories_provider.dart';
import 'package:jjmalltest/providers/navbar_provider.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavBarProvider>(context);
    final categoriesProvider = Provider.of<CategoryProvider>(context);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(78),
          child: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  navProvider.setCurrentIndex(0);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 40,
                )),
            title: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text("Categories"),
            ),
          ),
        ),
        body: GridView.count(
          // mainAxisSpacing: 10,
          crossAxisSpacing: 20,
          childAspectRatio: 1,
          crossAxisCount: 2,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children:
              categoriesProvider.categoriesList.indexed.map<Widget>((cat) {
            final listLength = categoriesProvider.categoriesList.length;
            return Padding(
              padding: EdgeInsets.only(
                  bottom: (listLength.isEven &&
                              (listLength - 1 == cat.$1 ||
                                  listLength - 2 == cat.$1) ||
                          (listLength.isOdd && listLength - 1 == cat.$1))
                      ? 10
                      : 0),
              child: CategoryCardLG(
                  index: cat.$1,
                  title: cat.$2.name,
                  image: "assets/images/" + cat.$2.image),
            );
          }).toList(),
        ));
  }
}
