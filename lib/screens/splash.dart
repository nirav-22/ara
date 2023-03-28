import 'package:ara/backend/AuthProvider.dart';
import 'package:ara/screens/home.dart';
import 'package:ara/screens/signup.dart';
import 'package:ara/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context,listen:false);

    return Scaffold(
      body: Container(
        child: Column(
          children: [

            Center(
              child: Image(image: AssetImage('images/ara.jfif'),height: 300,width: 300)
            ),
            ElevatedButton(onPressed: ()async{
              if (ap.isSignedIn == true) {
                await ap.getDataFromSP().whenComplete(
                      () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ),
                  ),
                );
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Welcome(),
                  ),
                );
              }
            }, child: Text('Get Started'))
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

