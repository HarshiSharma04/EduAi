import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'learning_style_result.dart'; // Import the LearningStyleResultScreen

class LearningStyleForm extends StatefulWidget {
  @override
  _LearningStyleFormState createState() => _LearningStyleFormState();
}

class _LearningStyleFormState extends State<LearningStyleForm> {
  int _question1 = 3;
  int _question2 = 3;
  int _question3 = 3;
  int _question4 = 3;
  int _question5 = 3;
  String _learningStyle = '';

  // Function to submit the form and make API request
  Future<void> _submitForm() async {
    final url = Uri.parse('http://10.0.2.2:5000/predict'); // Update with your Flask server address
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'Question1': _question1,
        'Question2': _question2,
        'Question3': _question3,
        'Question4': _question4,
        'Question5': _question5,
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        _learningStyle = jsonDecode(response.body)['learning_style'];
      });

      // Navigate to the result screen after getting the learning style
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LearningStyleResultScreen(learningStyle: _learningStyle),
        ),
      );
    } else {
      print('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Let\'s find your learning style',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            _buildQuestionSlider('How do you prefer to learn through pictures and diagrams?', _question1, (newValue) {
              setState(() {
                _question1 = newValue.round();
              });
            }),
            _buildQuestionSlider('How do you prefer to learn through lectures and discussions?', _question2, (newValue) {
              setState(() {
                _question2 = newValue.round();
              });
            }),
            _buildQuestionSlider('How do you prefer to learn through reading and writing?', _question3, (newValue) {
              setState(() {
                _question3 = newValue.round();
              });
            }),
            _buildQuestionSlider('How do you prefer to learn through hands-on activities?', _question4, (newValue) {
              setState(() {
                _question4 = newValue.round();
              });
            }),
            _buildQuestionSlider('How do you prefer to learn through experiments and applications?', _question5, (newValue) {
              setState(() {
                _question5 = newValue.round();
              });
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit'),
            ),
            if (_learningStyle.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Your learning style is: $_learningStyle',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionSlider(String question, int value, ValueChanged<double> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TextStyle(fontSize: 16),
        ),
        Slider(
          value: value.toDouble(),
          min: 1,
          max: 5,
          divisions: 4,
          label: value.toString(),
          onChanged: onChanged,
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
