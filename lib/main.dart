import 'package:flutter/material.dart';
import 'package:invoice/home.dart';
import 'package:invoice/print.dart';
import 'package:invoice/productdetails.dart';
import 'package:invoice/splash.dart';

int sum=0;
int tex=0;
double total=0;
double totaltax=0;

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => Splash(),
        'home':(context) => Home(),
        'details':(context) => Details(),
        'bill':(context) => Bill(),
      },
    ),
  );
}
