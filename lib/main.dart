import 'package:ara/backend/AuthProvider.dart';
import 'package:ara/screens/details.dart';
import 'package:ara/screens/home.dart';
import 'package:ara/screens/productList.dart';
import 'package:ara/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>AuthProvider())
      ],
      child: MaterialApp(
        home:ProductList(),// AFTER SPLASH HOME IF USER LOGGED IN ELSE WELCOME
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
