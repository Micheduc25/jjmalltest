import 'package:flutter/material.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({
    super.key,
  });
  static const String routeName = '/order-success';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: PreferredSize(
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Text("Thank You"),
          ),
          centerTitle: true,
          toolbarHeight: 100,
          bottom: PreferredSize(
              child: Divider(
                height: 1,
                thickness: 1,
                color: Color(0XFFF4F4F4),
              ),
              preferredSize: Size.fromHeight(2)),
        ),
        preferredSize: Size.fromHeight(110),
      ),
      bottomSheet: BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Color(0XFFF4F4F4),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(elevation: 0),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("GO BACK HOME")),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            );
          }),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/delivery.png"),
              const SizedBox(height: 40),
              Text(
                "Your Order in process",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 24),
              ),
              const SizedBox(height: 20),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17, height: 1.7),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
