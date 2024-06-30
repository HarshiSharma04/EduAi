
// learning_style_result.dart
import 'package:flutter/material.dart';

class LearningStyleResultPage extends StatelessWidget {
  final String learningStyle;

  LearningStyleResultPage({required this.learningStyle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning Style Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Your learning style is',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              learningStyle,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Image.network(
              'https://via.placeholder.com/150', // Replace with your image URL
              height: 200,
              width: 200,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text('Go to Homepage'),
            ),
          ],
        ),
      ),
    );
  }
}
