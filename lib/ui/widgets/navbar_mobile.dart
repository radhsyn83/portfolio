import 'package:flutter/material.dart';

class NavbarMobile extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const NavbarMobile({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 3,
          offset: const Offset(0, 2), // changes position of shadow
        ),
      ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          const Spacer(),
          Image.asset(
            "assets/images/logo.png",
            height: 40,
          ),
        ],
      ),
    );
  }
}
