import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:we_chat/core/theme/colors.dart';

import '../../api/apis.dart';
import '../../helper/dialogs.dart';
import '../../main.dart';
import '../home_screen.dart';

//login screen -- implements google sign in or sign up feature for app
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isAnimate = false;

  @override
  void initState() {
    super.initState();

    //for auto triggering animation
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() => _isAnimate = true);
    });
  }

  // handles google login button click
  _handleGoogleBtnClick() {
    //for showing progress bar
    Dialogs.showProgressBar(context);

    _signInWithGoogle().then((user) async {
      //for hiding progress bar
      Navigator.pop(context);

      if (user != null) {
        log('\nUser: ${user.user}');
        log('\nUserAdditionalInfo: ${user.additionalUserInfo}');

        if (await APIs.userExists() && mounted) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const HomeScreen()));
        } else {
          await APIs.createUser().then((value) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const HomeScreen()));
          });
        }
      }
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      await InternetAddress.lookup('google.com');
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await APIs.auth.signInWithCredential(credential);
    } catch (e) {
      log('\n_signInWithGoogle: $e');

      if(mounted){
        Dialogs.showSnackbar(context, 'Something Went Wrong (Check Internet!)');
      }
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    //initializing media query (for getting device screen size)
    mq = MediaQuery.sizeOf(context);

    return Scaffold(
      //app bar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Padding(
          padding:  EdgeInsets.only(top: 40.0),
          child:  Text(
            'Welcome to DevConnect',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize:25 ,
              )),
        ),
      ),
      
      //body
      bottomSheet: Container(
        height: 400,
        decoration: const BoxDecoration(
          color: CustomColors.greencolor,
          borderRadius:  BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(left: 86, right: 86, top: 20),
            //   child: ElevatedButton(
            //    onPressed: _handleGoogleBtnClick,
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: CustomColors.lightColor,
            //       surfaceTintColor: CustomColors.transparantColor,
            //       shadowColor: CustomColors.transparantColor,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(20),
            //       ),
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.only(top: 10, bottom: 10),
            //           child: Image.asset(
            //             "assets/th.jpeg",
            //             width: 60,
            //           ),
            //         ),
            //         Text(
            //           "GitHub",
            //           style: TextStyle(
            //             fontSize: 20,
            //             fontWeight: FontWeight.bold,
            //             color: CustomColors.greencolor,
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            // Text(
            //   'OR',
            //   style: GoogleFonts.varelaRound(
            //     color: Colors.white,
            //     fontSize: 30,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 86, right: 86, bottom: 20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  // side: const BorderSide(color: CustomColors.lightColor, width: 3),
                  backgroundColor: CustomColors.greencolor,
                  surfaceTintColor: CustomColors.transparantColor,
                  shadowColor: CustomColors.transparantColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 10, bottom: 10),
                    //   child: Image.asset(
                    //     "assets/git-lab-icon.png",
                    //     width: 60,
                    //   ),
                    // ),
                    // Center(
                    //   child: Text(
                    //     "Login with Google",
                    //     style: GoogleFonts.varelaRound(
                    //       fontSize: 22,
                    //       fontWeight: FontWeight.bold,
                    //       color: CustomColors.lightColor,
                    //     ),
                    //   ),
                    // )
                    // ElevatedButton(onPressed: _handleGoogleBtnClick, 
                    //   child: Text(
                    //     "Login with Google",
                    //     style: TextStyle(
                    //       fontSize: 20,
                    //     ),
                    //     ))
                    ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    // maximumSize: Size(2, 1),
                    backgroundColor: const Color.fromARGB(255, 223, 255, 187),
                    shape: const StadiumBorder(),
                    elevation: 1),

                // on tap
                onPressed: _handleGoogleBtnClick,

                //google icon
                icon: Image.asset('images/google.png', height: mq.height * .03),

                //login with google label
                label: RichText(
                  text: const TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 12),
                      children: [
                        TextSpan(text: 'Login with '),
                        TextSpan(
                            text: 'Google',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                      ]),
                )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
