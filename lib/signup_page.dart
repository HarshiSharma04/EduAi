import 'package:flutter/material.dart';
import 'learning_style_page.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? _selectedInterest;
  final List<String> _interests = ['Science', 'Math', 'History', 'Literature', 'Art', 'Technology', 'Sports'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: 50), // Adjusted height to make space for the image
              Image.network(
                'https://th.bing.com/th/id/OIP.gxbf3PjJ-pvBzIytJb8TVAHaFS?rs=1&pid=ImgDetMain' ,// Replace with your network image URL
                width: double.infinity,
                height: 300, // Adjusted height for the image
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.65, // Adjusted height to make the rectangle smaller
              decoration: BoxDecoration(
                color: Color(0xFFECE6E6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'SIGN UP',
                        style: TextStyle(
                          color: Color(0xFF002131),
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Username',
                          hintStyle: TextStyle(color: Color(0xFF531002)), // Changed the color of the hint text
                          fillColor: Colors.white, // Changed the color of the text field to white
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Email Address',
                          hintStyle: TextStyle(color: Color(0xFF531002)), // Changed the color of the hint text
                          fillColor: Colors.white, // Changed the color of the text field to white
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: 'Field of Interest',
                          hintStyle: TextStyle(color: Color(0xFF531002)), // Changed the color of the hint text
                          fillColor: Colors.white, // Changed the color of the text field to white
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        value: _selectedInterest,
                        items: _interests.map((String interest) {
                          return DropdownMenuItem<String>(
                            value: interest,
                            child: Text(interest),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedInterest = newValue;
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Color(0xFF531002)), // Changed the color of the hint text
                          fillColor: Colors.white, // Changed the color of the text field to white
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => QuizScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF48A9A6), // Changed the color of the sign up button
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          // Changed the color of the 'SIGN UP' text to white
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Already have an account?'),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LoginPage()),
                                );
                              },
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                  color: Color(0xFF002131),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SignUpPage(),
    routes: {
      '/signup': (context) => SignUpPage(),
    },
  ));
}
