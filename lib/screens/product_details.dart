import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  static const String routeName = '/product-details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height * 0.68,
            child: Container(
              alignment: Alignment.bottomCenter,
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(.26),
                      Colors.black.withOpacity(0)
                    ]),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/woman.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.sizeOf(context).height * 0.06),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < 3; i++)
                      Container(
                        width: 25,
                        height: 6,
                        margin: EdgeInsets.only(right: i != 2 ? 5 : 0),
                        decoration: BoxDecoration(
                            color: i == 2
                                ? Colors.white
                                : Colors.white.withOpacity(.3),
                            borderRadius: BorderRadius.circular(50)),
                      )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height * 0.28,
            bottom: 0,
            left: -5,
            right: -5,
            child: Card(
                elevation: 0,
                surfaceTintColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Fresh Orange",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500)),
                              ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Add to Cart".toUpperCase()),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor:
                                        Theme.of(context).colorScheme.primary,
                                    minimumSize: Size(150, 45),
                                    maximumSize: Size(150, 45),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$4.9",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Theme.of(context).primaryColor),
                              ),
                              Container(
                                // padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Color(0XFFEFEFEF),
                                    borderRadius: BorderRadius.circular(18)),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          // decrement counter
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5.0),
                                          child: Icon(
                                            Icons.remove,
                                            size: 30,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "3",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // increment counter
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5.0),
                                          child: Icon(
                                            Icons.add,
                                            size: 30,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ),
                                      )
                                    ]),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                // transform: Transform.translate(offset: Offset(0, 9))
                                //     .transform,
                                padding: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 2))),
                                child: Text(
                                  "Description",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  height: 3,
                                  color: Color(0XFFDDDDDD),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna, quis nostrud exercitation ullam ad minim veniam, qu is ullam offic dolor sit amet.\n",
                            style: TextStyle(fontSize: 17, height: 1.7),
                          ),
                          Text(
                            "Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna, quis.",
                            style: TextStyle(fontSize: 17, height: 1.7),
                          )
                        ]))),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: SafeArea(
              child: BackButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                    iconSize: MaterialStatePropertyAll(40)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
