import 'package:flutter/material.dart';

void main() {
  runApp(TimerApp());
}

class TimerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TimerScreen(),
    );
  }
}

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _seconds = 10; // Initial countdown time
  bool _isRunning = false;

  void _startTimer() {
    if (_isRunning) return;

    setState(() {
      _isRunning = true;
      _seconds = 15; // Reset timer when restarting
    });

    _countDown();
  }

  void _countDown() {
    if (_seconds > 0) {
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          _seconds--;
        });
        _countDown(); // Recursively call until time is up
      });
    } else {
      setState(() {
        _isRunning = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Timer App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add picture here
            Image.network(
              'https://images.unsplash.com/photo-1518281361980-b26bfd556770?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dGltZXxlbnwwfHwwfHx8MA%3D%3D',
              height: 500,
            ),
            SizedBox(height: 30),

            Text(
              '$_seconds',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: _startTimer,
              child: Text(_isRunning ? "Running..." : "Start Timer"),
            ),
          ],
        ),
      ),
    );
  }
}
