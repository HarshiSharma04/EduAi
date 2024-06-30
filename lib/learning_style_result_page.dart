import 'package:flutter/material.dart';
import 'package:smart_learning_application/home_page_visual.dart';

class LearningStyleResultPage extends StatelessWidget {
  final String selectedStyle; // Placeholder for selected learning style

  const LearningStyleResultPage({Key? key, required this.selectedStyle}) : super(key: key);

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
                // Heading: Your learning style is
                Text(
                  'Your learning style is',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF002131)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),

                // Selected learning style
                Text(
                  selectedStyle,
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFF002131)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),

                // Network image
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage('https://cdni.iconscout.com/illustration/premium/thumb/group-study-4029949-3345550.png'), // Replace with your network image URL
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(height: 40),

                // Button to navigate back to homepage
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    ); // Navigate back to previous screen (homepage)
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF48A9A6)),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'Back to Homepage',
                    style: TextStyle(fontSize: 16, color: Colors.white),
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
