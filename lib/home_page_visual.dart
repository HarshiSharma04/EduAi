import 'package:flutter/material.dart';
import 'ai_tutor.dart'; // Import the AI Tutor page

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _selectedPreference; // Initialize as null to avoid the initial value error

  // Dummy list of subjects for demonstration
  List<String> subjectNames = [
    'Maths', 'Science', 'History', 'Language', 'Arts',
    'Geography', 'Music', 'Computer', 'Physics', 'Biology',
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
      // Navigate to Home (current page)
        break;
      case 1:
      // Navigate to My Learning
      // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => MyLearningPage()));
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AiTutorPage()),
        );
        break;
    }
  }

  void _navigateToFocusMode() {
    // Navigate to focus mode screen or implement focus mode logic
    // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => FocusModeScreen()));
    // Replace FocusModeScreen with your actual focus mode implementation
  }

  TextEditingController _taskController = TextEditingController();
  List<String> tasks = [];

  void _addTask(String task) {
    setState(() {
      tasks.add(task);
      _taskController.clear(); // Clear input field after adding task
    });
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF48A9A6),
        title: Text('EduAI'),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Navigate to profile screen or show profile menu
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF48A9A6),
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Handle navigation to item 1
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Handle navigation to item 2
              },
            ),
            // Add more list items as needed
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search courses',
                        suffixStyle: TextStyle(color: Color(0xFF531002)),
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Adjust spacing between search bar and dropdown button
                  DropdownButton<String>(
                    hint: Text(
                      'Preference',
                      style: TextStyle(color: Color(0xFF531002)),
                    ),
                    value: _selectedPreference,
                    items: ['Visual', 'Auditory', 'Reading/Writing', 'Kinesthetic']
                        .map((String preference) {
                      return DropdownMenuItem<String>(
                        value: preference,
                        child: Text(
                          preference,
                          style: TextStyle(color: Colors.black87), // Adjust text color
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedPreference = newValue;
                      });
                      // Implement logic to filter based on preference
                    },
                    icon: Icon(Icons.arrow_drop_down),
                    underline: Container(),
                    elevation: 0,
                    style: TextStyle(color: Color(0xFFFDB8AF)), // Set dropdown button text color
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Recommended for you',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF002131)),
              ),
              SizedBox(height: 10),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, // Replace with actual data length
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: [
                          Image.network(
                            'https://placehold.it/200x200',
                            width: 150,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Video ${index + 1}'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Subjects',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF002131)),
              ),
              SizedBox(height: 10),
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: subjectNames.length,
                  itemBuilder: (BuildContext context, int index) {
                    String subjectName = subjectNames[index];
                    return _buildSubjectCard(subjectName, index);
                  },
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Your Tasks',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF002131)),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _taskController,
                      decoration: InputDecoration(
                        hintText: 'Enter task',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            _addTask(_taskController.text.trim());
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tasks[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _deleteTask(index);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          color: Color(0xFF48A9A6),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.white, // Color of selected item's icon and text
          unselectedItemColor: Colors.white.withOpacity(0.6), // Color of unselected item's icon and text
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'My Learning',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'AI Tutor',
            ),
          ],
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed, // Ensure the items are always visible
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToFocusMode,
        tooltip: 'Focus Mode', // Provide a tooltip for accessibility
        backgroundColor: Color(0xFF48A9A6), // Set the background color
        child: Icon(Icons.timer, color: Colors.white), // Set the icon color to white
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // Move FAB to the right side above the bottom navigation bar
    );
  }

  Widget _buildSubjectCard(String subjectName, int index) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          // Handle card tap
        },
        child: Container(
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.book,
                size: 50,
                color: Color(0xFF48A9A6),
              ),
              SizedBox(height: 10),
              Text(
                subjectName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF002131),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
