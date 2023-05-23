import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tourist_app/CheckYourEmail.dart';
import 'package:tourist_app/Home.dart';
import 'package:tourist_app/login.dart';

class auth extends StatelessWidget {
  const auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Home();
        } else {
          return loginscreen();
        }
      },
    ));
  }
}
