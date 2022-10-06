// ignore_for_file: use_build_context_synchronously, sort_child_properties_last

import 'package:exam_app/constants/r.dart';
import 'package:exam_app/views/main_page.dart';
import 'package:exam_app/views/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String route = "login_screen";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<UserCredential> signInWithGoogle() async {
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
    print("credensial");
    print(credential);
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                R.strings.login,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Image.asset(R.assets.imgLogin),
            const SizedBox(
              height: 25,
            ),
            Text(
              R.strings.welcome,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              R.strings.loginDescription,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 80, 80, 80),
                fontSize: 14,
              ),
            ),
            const Spacer(),
            ButtonLogin(
              // Login with Google
              onTap: () async {
                print("google dipencet");
                await signInWithGoogle();

                final user = FirebaseAuth.instance.currentUser;

                if (user != null) {
                  print("sini print usernya");
                  print(user);
                  Navigator.of(context).pushReplacementNamed(MainPage.route);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Gagal Masuk"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              backgroundColor: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(R.assets.icGoogle),
                  Text(
                    R.strings.loginWithGoogle,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              borderColor: R.colors.primary,
            ),
            ButtonLogin(
              // Login with Apple
              onTap: () {},
              backgroundColor: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(R.assets.icAple),
                  Text(
                    R.strings.loginWithApple,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              borderColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({
    Key? key,
    required this.backgroundColor,
    required this.child,
    required this.borderColor,
    required this.onTap,
  }) : super(key: key);

  final Color backgroundColor;
  final Widget child;
  final Color borderColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Button Google
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              elevation: 0,
              fixedSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onPressed: onTap,
            child: child,
          ),
        ],
      ),
    );
  }
}
