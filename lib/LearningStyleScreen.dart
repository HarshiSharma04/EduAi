import 'package:flutter/material.dart';
import 'FadeInAnimation.dart'; // Import your animation class
import 'learning_style_form.dart'; // Import your learning style form class

class LearningStyleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Learning Style')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Let\'s find your learning style',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            FadeInAnimation(
              child: LearningStyleForm(),
            ),
          ],
        ),
      ),
    );
  }
}