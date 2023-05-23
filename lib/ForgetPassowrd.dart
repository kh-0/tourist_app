import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';

class password extends StatefulWidget {
  const password({super.key});

  @override
  State<password> createState() => _passwordState();
}

class _passwordState extends State<password> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Password reset link sent to your email"),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //////////////////////
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      //////////////////////////////
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: <Widget>[
/////////////////////////////////////////////////

            const SizedBox(
              height: 70,
            ),
///////////////////////////////////////////
            Image.asset(
              'images/logo2.png',
              width: 250,
              height: 200,
            ),
/////////////////////////////////////////////////////
            const SizedBox(
              height: 30,
            ),
            ////////////////////////////////////////
            Text(
              'Forget your password!? ',
              style: GoogleFonts.robotoCondensed(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Dont wory we will helb you ',
              style: GoogleFonts.robotoCondensed(fontSize: 15),
            ),
            ///////////////////////////////////////////
            const SizedBox(
              height: 40,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          )),
                      //   border: InputBorder.none,
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                    ),
                  ),
                ),
              ),
            ),
//////////////////////////////////////////////////////////////
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              elevation: 5.0,
              color: Colors.deepPurple,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
              child: const Text(
                'Send',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
              onPressed: passwordReset,
            ),
///////////////////////////////////button

////////////////////////////////////////////////////////////
            ///
            const SizedBox(
              height: 140,
            ),
            MaterialButton(
              elevation: 5.0,
              color: Colors.deepPurple,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
              child: const Text(
                'go back to Sign In',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const loginscreen();
                }));
              },
            ),

////////////////////////////////////////////////////////////////
          ]),
        ),
      ),
    );
  }
}
