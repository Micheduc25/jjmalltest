import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 90,
            elevation: 16,
            surfaceTintColor: Colors.transparent,
            title: Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 20),
              child: Text("Profile"),
            ),
            bottom: PreferredSize(
                child: Divider(
                  height: 1,
                  thickness: 1,
                  color: Color(0XFFF4F4F4),
                ),
                preferredSize: Size.fromHeight(2)),
          ),
          preferredSize: Size.fromHeight(100.0)),
      body: Center(
          child: ListView(
        children: [
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 10)),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/woman.png"),
              radius: 80,
            ),
          )
        ],
      )),
    );
  }
}
