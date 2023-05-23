import 'package:flutter/material.dart';
import 'package:tourist_app/Home.dart';
import 'package:tourist_app/login.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:tourist_app/signUp.dart';

import 'auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      /////////////////////////////////////////////////////
      initialRoute: '/login',

      routes: {
        // define your app's screens here
        //'/': (context) => const auth(),
        '/login': (context) => const loginscreen(),
        //  '/SignUp': (context) => const signUp(),
        '/home': (context) => const Home(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const auth(),
      // home:  Home(),
    );
  }
}
