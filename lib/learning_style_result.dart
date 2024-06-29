import 'package:flutter/material.dart';

class LearningStyleResultScreen extends StatelessWidget {
  final String learningStyle;

  LearningStyleResultScreen({required this.learningStyle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning Style Result'),
      ),
      body: Center(
        child: Text(
          'Your learning style is: $learningStyle',
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
