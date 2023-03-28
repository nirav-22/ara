import 'package:ara/backend/AuthProvider.dart';
import 'package:ara/components/My_drawer.dart';
import 'package:ara/components/my_nav_bar.dart';
import 'package:ara/screens/checkout.dart';
import 'package:ara/screens/homePage.dart';
import 'package:ara/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Container(
      color: Colors.black,
    ),
    CheckOut()
  ];
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context,listen: false);
    return  Scaffold(
          appBar: AppBar(
            title: Text('Ara',style: TextStyle(
                fontFamily: 'Inspiration',
                fontSize: 45,
                fontWeight: FontWeight.bold
            ),),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: (){},
                  child: Image(image: AssetImage('images/whatsapp.png'),
                    height: 40,
                    width: 40,),
                ),
              )
            ],
            backgroundColor: Colors.purple[900],
          ),

          body:Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),

          drawer: NavBar(),
          bottomNavigationBar: Container(
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
          ),

        );
  }
}
