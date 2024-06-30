import 'package:flutter/material.dart';
import 'learning_style_result_page.dart'; // Import the result page

void main() {
  runApp(MaterialApp(
    home: QuizScreen(),
  ));
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;

  // Questions data
  List<Map<String, dynamic>> _questions = [
    {
      'question': 'Do you find it easier to remember information when you see it written down or when you hear it spoken?',
      'options': ['Written down', 'Spoken'],
      'selectedOption': null, // Initially no option selected
    },
    {
      'question': 'When studying, do you prefer reading textbooks and articles, or do you prefer listening to lectures and discussions?',
      'options': ['Reading textbooks and articles', 'Listening to lectures and discussions'],
      'selectedOption': null,
    },
    {
      'question': 'Do you use diagrams, charts, and maps to help understand and remember information?',
      'options': ['Yes', 'No'],
      'selectedOption': null,
    },
    {
      'question': 'Do you find hands-on activities and experiments more helpful than reading or listening to learn new material?',
      'options': ['Yes', 'No'],
      'selectedOption': null,
    },
    {
      'question': 'Do you take detailed notes during lectures or while reading, and then review them later?',
      'options': ['Yes', 'No'],
      'selectedOption': null,
    },
    {
      'question': 'Do you often read your notes out loud or use recordings to study?',
      'options': ['Yes', 'No'],
      'selectedOption': null,
    },
    {
      'question': 'When working on group projects, do you prefer discussing and explaining ideas with your teammates or creating visual presentations?',
      'options': ['Discussing and explaining ideas', 'Creating visual presentations'],
      'selectedOption': null,
    },
    {
      'question': 'Do you prefer learning through real-world examples and practical applications rather than theoretical concepts?',
      'options': ['Yes', 'No'],
      'selectedOption': null,
    },
    {
      'question': 'Do you often use lists, definitions, and handouts to study?',
      'options': ['Yes', 'No'],
      'selectedOption': null,
    },
    {
      'question': 'Do you enjoy summarizing information in your own words to help solidify your understanding of a topic?',
      'options': ['Yes', 'No'],
      'selectedOption': null,
    },
  ];

  void _handleOptionSelected(int questionIndex, int selectedOptionIndex) {
    setState(() {
      _questions[questionIndex]['selectedOption'] = selectedOptionIndex;
    });
  }

  void _submitQuiz() {
    // Navigate to result page upon submission
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LearningStyleResultPage(
          selectedStyle: 'Visual', // Hardcoded for now, replace with actual logic to determine style
        ),
      ),
    );
  }

  List<Widget> _buildOptions(int questionIndex) {
    List<Widget> optionWidgets = [];
    List<String> options = _questions[questionIndex]['options'];
    for (int i = 0; i < options.length; i++) {
      optionWidgets.add(
        RadioListTile(
          title: Text(options[i]),
          value: i, // Explicitly cast i to int
          groupValue: _questions[questionIndex]['selectedOption'],
          onChanged: (value) {
            _handleOptionSelected(questionIndex, value as int); // Cast value to int
          },
        ),
      );
    }
    return optionWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://i.pinimg.com/736x/ee/e1/d4/eee1d4114e36fa5f1dc7358c60f4b290.jpg'), // Replace with your network image URL
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Custom heading
                Text(
                  "Let's find your learning style!",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF002131)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),

                // Question card with options
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          _questions[_currentQuestionIndex]['question'],
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),

                        // Options
                        Column(
                          children: _buildOptions(_currentQuestionIndex),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Next or Submit button
                ElevatedButton(
                  onPressed: () {
                    if (_currentQuestionIndex < _questions.length - 1) {
                      setState(() {
                        _currentQuestionIndex++;
                      });
                    } else {
                      _submitQuiz();
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        // Set button color based on state
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.grey; // Disabled color
                        } else {
                          return Color(0xFF48A9A6); // Enabled color
                        }
                      },
                    ),
                  ),
                  child: Text(
                    _currentQuestionIndex < _questions.length - 1 ? 'Next' : 'Submit',
                    style: TextStyle(color: Colors.white), // Text color
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
