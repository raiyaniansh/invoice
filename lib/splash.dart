import 'dart:async';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3),() {
      setState(() {
        Navigator.pushReplacementNamed(context, 'home');
      });
    },);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Stack(
          children: [
            Align(alignment: Alignment.center,child: Image.asset('assets/images/logo.png',width: 250)),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                ),
                alignment: Alignment.center,
                child: CircularProgressIndicator(color: Colors.grey.shade900),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
