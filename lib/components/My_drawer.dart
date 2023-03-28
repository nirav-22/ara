import 'package:ara/backend/AuthProvider.dart';
import 'package:ara/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context,listen: false);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          CircleAvatar(
            backgroundColor: Colors.cyan,
            backgroundImage: NetworkImage(ap.userModel.profilePic),
            radius: 50,
          ),

          ListTile(
            leading: Icon(Icons.shopping_cart_checkout),
            title: Text('Cart'),
            onTap: () => null,
          ),

          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorites'),
            onTap: () => null,
          ),

          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () => null,
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () async{
              ap.userSignOut().then(
                    (value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Welcome(),
                  ),
                ),
              );
            },
          ),

        ],
      ),
    );
  }
}
