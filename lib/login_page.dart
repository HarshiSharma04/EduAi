import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: 50), // Adjusted height to make space for the image
              Image.network(
                'https://thumbs.dreamstime.com/b/woman-working-remote-project-home-cartoon-character-female-freelancer-sitting-table-fulfilling-tasks-laptop-flat-181611910.jpg', // Replace with your network image URL
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
              height: MediaQuery.of(context).size.height * 0.55, // Adjusted height to make the rectangle smaller
              decoration: BoxDecoration(
                color: Color(0xFFECE6E6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'LOGIN',
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
                        hintText: 'Name',
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
                        // Handle login
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF48A9A6), // Changed the color of the login button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(fontSize: 18, color: Colors.white), // Changed the color of the 'LOGIN' text to white
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Don\'t have an account?'),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/signup');
                            },
                            child: Text(
                              'SIGN UP',
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
        ],
      ),
    );
  }
}


