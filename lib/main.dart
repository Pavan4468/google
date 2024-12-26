import 'package:flutter/material.dart';
import 'sigin.dart';
import 'signup.dart';
import 'home.dart'; // Import your HomePage here

void main() {
  runApp(PoorMartApp());
}

class PoorMartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Helping Mart',
      debugShowCheckedModeBanner: false,
      initialRoute: '/signin',
      routes: {
        '/signin': (context) => SignInPage(),
        '/signup': (context) => SignUpPage(),
        '/home': (context) => HomePage(), // Add HomePage route here
      },
    );
  }
}
