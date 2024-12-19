import 'package:flutter/material.dart';
import 'package:walletapp/screens/Billing/Bill1.dart';
import 'package:walletapp/screens/Billing/Bill3.dart';
import 'package:walletapp/screens/Main/HomePage.dart';
import './screens/Login/splash.dart';
import './screens/Login/OnBoarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Income and Expenses',
      initialRoute: '/',
      routes: {
        '/': (context) => const Bill1(),
        // '/OnBoarding': (context) => OnBoarding(),
        // '/OnBoarding': (context) => HomePage(),
        '/OnBoarding': (context) => Bill3(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
