import 'dart:async';
import 'package:flutter/material.dart';
import 'login_page.dart'; // Ensure this import points to your home page file

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginPage(), // Change this to your home page
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'EduAi',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Image.network(
              'https://png.pngtree.com/png-vector/20230728/ourmid/pngtree-bookkeeping-clipart-image-of-working-woman-and-papers-cartoon-vector-png-image_6793594.png', // Replace with your network image URL
              width: 200, // Adjust the size as needed
              height: 200, // Adjust the size as needed
            ),
          ],
        ),
      ),
    );
  }
}
