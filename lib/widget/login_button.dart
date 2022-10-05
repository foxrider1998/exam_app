// ignore_for_file: avoid_print, unnecessary_import, implementation_imports

import 'package:exam_app/constants/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginButton extends StatelessWidget {
  LoginButton({super.key, required this.text, required this.pic});
  String? text;

  String? pic;
  @override
  Widget build(BuildContext context) {
    print(text);
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: R.colors.primary,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25))),
          onPressed: () {},
          child: Row(
            children: [
              Image.asset(
                pic!,
                width: 20,
                height: 20,
              ),
              Text(
                text!,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.amber,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
