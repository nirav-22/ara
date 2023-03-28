import 'package:ara/screens/checkout.dart';
import 'package:ara/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyNav extends StatefulWidget {
  const MyNav({Key? key}) : super(key: key);

  @override
  State<MyNav> createState() => _MyNavState();
}

class _MyNavState extends State<MyNav> {
  int _selectedIndex = 0;
  final List<String> _titles = const[
    'Home',
    'Favorites',
    'CheckOut'
  ];
  final List<Widget> _widgetOptions = <Widget>[
    Home(),
    Container(
      color: Colors.black,
    ),
    CheckOut()
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[900],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: GNav(
          backgroundColor: Colors.purple.shade900,
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.pink.shade50.withOpacity(.5),
          gap: 8,
          padding: EdgeInsets.all(15),
          selectedIndex: _selectedIndex,
          onTabChange: (index){
            setState(() {
              _selectedIndex = index;
            });
          },
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.favorite,
              text: 'Favorites',
            ),
            GButton(
              icon: Icons.shopping_cart_checkout,
              text: 'Check Out',
            ),
          ],
        ),
      ),
    );
  }
}
