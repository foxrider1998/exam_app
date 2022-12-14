// ignore_for_file: unused_import, use_build_context_synchronously

import 'dart:async';
import 'package:exam_app/constants/r.dart';
import 'package:exam_app/firebase_options.dart';
import 'package:exam_app/helpers/user_email.dart';
import 'package:exam_app/models/network_response.dart';
import 'package:exam_app/models/user_by_email.dart';
import 'package:exam_app/repository/auth_api.dart';
import 'package:exam_app/views/main_page.dart';
import 'package:exam_app/views/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:firebase_core/firebase_core.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String route = "spash_screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () async {
      final user = UserEmail.getUserEmail();
      print(user);
      if (user != null) {
        final dataUser = await AuthApi().getUserByEmail();
        if (dataUser.status == Status.success) {
          final data = UserByEmail.fromJson(dataUser.data!);
          if (data.status == 1) {
            Navigator.of(context).pushReplacementNamed(MainPage.route);
          }
          //  else {
          //   Navigator.of(context).pushReplacementNamed(RegisterPage.route);
          // }
        }
      } else {
        Navigator.of(context).pushReplacementNamed(LoginPage.route);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.primary,
      body: Center(
        child: Image.asset(
          R.assets.icSplash,
          width: MediaQuery.of(context).size.width * 0.5,
        ),
      ),
    );
  }
}
