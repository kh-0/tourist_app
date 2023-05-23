import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourist_app/login.dart';
import 'package:tourist_app/home.dart';

import 'CheckYourEmail.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);
  @override
  State<signUp> createState() => _signUpState();
}

//////////////Text('Go Back')
class _signUpState extends State<signUp> {
////////////////////////////////////////////
  final _emailController = TextEditingController();
  final _epasswordlController = TextEditingController();
  final _confirmpasswordlController = TextEditingController();

////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////

  ////////////////////////////sign up//////////////////////////////
  Future signUp() async {
    if (passwordConfirm()) //{

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _epasswordlController.text.trim(),
        );

        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const CheckYourEmail();
          //loginscreen();
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
      }
    else
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Error! Not the same password"),
            );
          });
  }

//////////////////////////////////////////
  bool passwordConfirm() {
    if (_epasswordlController.text.trim() ==
        _confirmpasswordlController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    //  super.dispose();
    _emailController.dispose();
    _epasswordlController.dispose();
    _confirmpasswordlController.dispose();

    super.dispose();
  }

////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /////////////////////////////////
      appBar: AppBar(
          backgroundColor: Colors.deepPurple[300],
          elevation: 0,
          title: const Text('Go Back')),
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
              height: 20,
            ),
///////////////////////////////////////////
            // Image.asset(
            // 'images/logo2.png',
            // width: 250,
            // height: 200,
            //  ),
/////////////////////////////////////////////////////
            const SizedBox(
              height: 15,
            ),
            ////////////////////////////////////////
            Text(
              'Sgin Up ',
              style: GoogleFonts.robotoCondensed(
                  fontSize: 30, fontWeight: FontWeight.bold),
            ),

            const SizedBox(
              height: 15,
            ),
            Text('Please fill in the form to continue ',
                style: GoogleFonts.robotoCondensed(
                    fontSize: 17, fontWeight: FontWeight.bold)),

            ///////////////////////////////////////////
            const SizedBox(
              height: 50,
            ),

//////////////////////////////////////////////////////////////

            const SizedBox(
              height: 15,
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
              height: 15,
            ),

//////////////////////////////////////////////////////////////

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

//////////////////////////////////////////////////////////////

            const SizedBox(
              height: 15,
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
                    controller: _confirmpasswordlController,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          )),
                      //   border: InputBorder.none,
                      hintText: 'ConfirmPassword',
                      prefixIcon: const Icon(Icons.https),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            Text('(password must consist of at least 6 characters) ',
                style: GoogleFonts.robotoCondensed(
                    fontSize: 10, fontWeight: FontWeight.normal)),

///////////////////////////////////button
            const SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              child: GestureDetector(
                onTap: signUp,
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: Text(
                      'Sign Up',
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

            const SizedBox(
              height: 10,
            ),

            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const loginscreen();
                }));
              },
              child: const Text(
                'Alredy have an account?',
                style: TextStyle(color: Colors.deepPurple, fontSize: 15),
              ),
            ),

            const SizedBox(
              height: 15,
            ),

////////////////////////////////////////////////////////////////
          ]),
        ),
      ),
    );
  }
}
