import 'dart:async';
import 'package:flutter/material.dart';

class FocusModePage extends StatefulWidget {
  @override
  _FocusModePageState createState() => _FocusModePageState();
}

class _FocusModePageState extends State<FocusModePage> {
  Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _stopwatch.start();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {}); // Update UI every second
    });
  }

  void _stopTimer() {
    _stopwatch.stop();
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Focus Mode'),
        backgroundColor: Color(0xFF48A9A6),
      ),*/
      body: Stack(
        children: [
          Positioned.fill(
            top: AppBar().preferredSize.height - 60, // Adjusted to reduce the distance
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                  'https://saferschoolsni.co.uk/wp-content/uploads/2022/05/stressed-student-01-800x633.png',
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Container(
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Start studying without any disturbance\nEnable it to enhance your concentration',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Color(0xFF531002)),
                          ),
                          SizedBox(height: 20),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.blue.shade400, width: 4),
                                ),
                                child: CircularProgressIndicator(
                                  value: _stopwatch.elapsed.inSeconds / 1800, // Example: 30 minutes study session
                                  backgroundColor: Colors.grey,
                                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF531002)),
                                ),
                              ),
                              Text(
                                '${_stopwatch.elapsed.inMinutes}:${(_stopwatch.elapsed.inSeconds.remainder(60)).toString().padLeft(2, '0')}',
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          ElevatedButton.icon(
                            onPressed: _stopTimer,
                            icon: Icon(Icons.stop),
                            label: Text('End Focus Mode'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Color(0xFF48A9A6),
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Visibility(
                            visible: _stopwatch.elapsed.inMinutes >= 30,
                            child: Text(
                              'Great job! You have completed your focus session.',
                              style: TextStyle(fontSize: 18, color: Colors.green),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _stopwatch.stop();
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    home: FocusModePage(),
    routes: {
      '/focusmode': (context) => FocusModePage(),
    },
  ));
}
