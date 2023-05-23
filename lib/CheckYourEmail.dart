import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourist_app/Home.dart';
import 'package:flutter/material.dart';
import 'package:tourist_app/auth.dart';

import 'SelectDesiresPage.dart';

class CheckYourEmail extends StatefulWidget {
  const CheckYourEmail({super.key});

  @override
  State<CheckYourEmail> createState() => _CheckYourEmailState();
}

class _CheckYourEmailState extends State<CheckYourEmail> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  //////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        Duration(seconds: 10),
        (_) => checkEmailVerifide(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

///////////////////////////////check email///////////////////////////////
  Future checkEmailVerifide() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) timer?.cancel();
  }

////////////////////////////resendRmail auth////////////////////////
  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() => canResendEmail = false);
      await Future.delayed(Duration(seconds: 10));
      setState(() => canResendEmail = true);
    } catch (e) {}
  }
////////////////////////////email is check/////////////

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? auth()
      : Scaffold(
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
                  'Check Your Email ',
                  style: GoogleFonts.robotoCondensed(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'we send an email to you click the link to confirm your account ',
                  style: GoogleFonts.robotoCondensed(fontSize: 20),
                ),

                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: GestureDetector(
                    onTap: sendVerificationEmail,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Text(
                          'Resent Email',
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
/////////////////////////////////////goBack butten///////////////
                ///
                TextButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                  ),
                  child: Text(
                    'cancel',
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: () => FirebaseAuth.instance.signOut(),
                )

                /*   Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: GestureDetector(
                    onTap: () => FirebaseAuth.instance.signOut(),
                    





                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Text(
                          'GoBack TO SignUp Page',
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
*/
                ///////////////////////////////////////////
              ]),
            ),
          ),
        );
}
