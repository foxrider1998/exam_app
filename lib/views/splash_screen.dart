import 'dart:async';
import 'package:exam_app/constants/r.dart';
import 'package:exam_app/firebase_options.dart';
import 'package:exam_app/views/main_page.dart';
import 'package:exam_app/views/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'register_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String route = "splash_screen";

  Future<void> initializeDefault() async {
    FirebaseApp app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('Initialized default app $app');
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
      () {
        print("sini ok");
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => LoginPage()),
        // );
        final user = FirebaseAuth.instance.currentUser;
        print(user);
        if (user != null) {
          // Redirect Register or Home
          Navigator.of(context).pushNamed(MainPage.route);
        } else {
          Navigator.of(context).pushNamed(RegisterPage.route);
        }
      },
    );
    return Scaffold(
      backgroundColor: R.colors.primary,
      body: Center(
        child: Image.asset(
          R.assets.icSplash,
          height: 40,
        ),
      ),
    );
  }
}
