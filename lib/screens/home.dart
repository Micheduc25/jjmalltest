import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jjmalltest/components/categories_card.dart';
import 'package:jjmalltest/components/product_card.dart';
import 'package:jjmalltest/controllers/home_controller.dart';
import 'package:jjmalltest/controllers/navbar_controller.dart';
import 'package:jjmalltest/screens/product_details.dart';
import 'package:provider/provider.dart';

import '../controllers/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeController>(context);
    final navbarProvider = Provider.of<NavBarController>(context);
    final authController = Provider.of<AuthController>(context);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            automaticallyImplyLeading: false,
            // surfaceTintColor: Colors.transparent,
            title: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text("Good Morning",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Theme.of(context).colorScheme.tertiary)),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${authController.currentUser!.nickName}",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      ImageIcon(AssetImage("assets/images/ic_notif.png"))
                    ]),
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  IconButton(
                      onPressed: () {
                        navbarProvider.setCurrentIndex(1);
                      },
                      icon: Icon(Icons.arrow_forward))
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CarouselSlider.builder(
                itemCount: homeProvider.categoryImages.length,
                itemBuilder: (context, index, realIndex) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: CategoryCard(
                        image: "assets/images/" +
                            homeProvider.categoryImages[index]),
                  );
                },
                options: CarouselOptions(
                  height: 100,
                  viewportFraction: 0.27,
                  aspectRatio: 1.0,
                  enlargeCenterPage: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 1000),
                  autoPlayCurve: Curves.fastOutSlowIn,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Latest Products",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 3 / 4,
                  children: homeProvider.latestProducts
                      .map<Widget>((item) => ProductCard(
                            image: item["image"],
                            title: item["title"],
                            price: item["price"],
                            isFavorite: item["isFavorite"],
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(ProductDetailsScreen.routeName);
                            },
                          ))
                      .toList(),
                ))
          ],
        ));
  }
}
