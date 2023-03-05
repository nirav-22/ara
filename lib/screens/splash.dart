import 'package:ara/screens/welcome.dart';
import 'package:flutter/material.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  
  @override
  void initState(){
    super.initState();
    _navigatetoLogin();
  }

  _navigatetoLogin() async{

    await Future.delayed(Duration(milliseconds: 5000), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Welcome() ));

}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(image: AssetImage('images/ara.jfif'),height: 300,width: 300)
      ),
      backgroundColor: Colors.black,
    );
  }
}
