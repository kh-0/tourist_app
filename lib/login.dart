import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourist_app/forgetPassowrd.dart';
import 'package:tourist_app/home.dart';
import 'package:tourist_app/signUp.dart';

class loginscreen extends StatefulWidget {
  //const loginscreen({super.key});
  const loginscreen({Key? key}) : super(key: key);
  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  ///////////////////////////////////////////////////////////////
  final _emailController = TextEditingController();
  final _epasswordlController = TextEditingController();

  Future SignIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _epasswordlController.text.trim(),
      );

      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const Home();
      }));
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
      //  showDialog(
      //  context: context,
      //   builder: (context) {
      //     return AlertDialog(
      //       content: Text("Email or Passowrd incorrect"),
      //       );
      //     });
    }
  }

  @override
  void dispose() {
    //  super.dispose();
    _emailController.dispose();
    _epasswordlController.dispose();
    super.dispose();
  }

///////////////////////////////////////////////////////////////
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
              height: 15,
            ),
            ////////////////////////////////////////
            Text(
              'Sgin In ',
              style: GoogleFonts.robotoCondensed(
                  fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              'Welcome back  Nice to see you again ',
              style: GoogleFonts.robotoCondensed(fontSize: 10),
            ),
            ///////////////////////////////////////////
            const SizedBox(
              height: 60,
            ),
////////////////////////email///////////////////

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

/////////////////////////////password/////////////////////////////////

            const SizedBox(
              height: 30,
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
                    controller: _epasswordlController,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          )),
                      //   border: InputBorder.none,
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.https),
                    ),
                  ),
                ),
              ),
            ),

/////////////////////////////////////////////////////////
            const SizedBox(
              height: 30,
            ),
            ///////////////////////////////////button//////////////////////

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
              child: GestureDetector(
                onTap: SignIn,
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.robotoCondensed(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ),

////////////////////////////////////////////////////////////
            ///
            const SizedBox(
              height: 20,
            ),

            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const password();
                }));
              },
              child: const Text(
                'Forget the Password ?',
                style: TextStyle(color: Colors.deepPurple, fontSize: 15),
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            Text(
              'Not yet a member? ',
              style: GoogleFonts.robotoCondensed(fontSize: 10),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const signUp();
                }));
              },
              child: const Text(
                'Sign Up ?',
                style: TextStyle(color: Colors.deepPurple, fontSize: 15),
              ),
            )

////////////////////////////////////////////////////////////////
          ]),
        ),
      ),
    );
  }
}
