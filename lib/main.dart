import 'package:flutter/material.dart';
import 'package:smart_learning_application/splash_screen.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'home_page_visual.dart';
 // Ensure you have a signup_page.dart file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduAi',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,// Set LoginPage as the initial page
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(), // Ensure this points to your signup page
      },
    );
  }
}
