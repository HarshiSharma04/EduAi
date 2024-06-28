import 'package:flutter/material.dart';

class LearningStyleResultScreen extends StatelessWidget {
  final String learningStyle;

  const LearningStyleResultScreen({Key? key, required this.learningStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning Style Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your learning style is:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              learningStyle,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            // Add an image related to the learning style
            Image.asset(
              _getImageForLearningStyle(learningStyle),
              height: 200,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the previous screen (home page)
              },
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }

  String _getImageForLearningStyle(String learningStyle) {
    // Implement logic to return appropriate image asset path based on learning style
    // Example:
    if (learningStyle == 'Visual Learner') {
      return 'assets/images/visual_learner.png';
    } else if (learningStyle == 'Auditory Learner') {
      return 'assets/images/auditory_learner.png';
    } else if (learningStyle == 'Reading/Writing Learner') {
      return 'assets/images/reading_writing_learner.png';
    } else if (learningStyle == 'Kinesthetic Learner') {
      return 'assets/images/kinesthetic_learner.png';
    }
    // Default image or error handling
    return 'assets/images/default_learner.png';
  }
}
