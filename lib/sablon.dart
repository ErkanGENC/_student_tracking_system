import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: myApp(),
    ),
  );
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text("sablon"),
        backgroundColor: Colors.orange, // arka plan rengi
        foregroundColor: Colors.black, // yazisi
      ),
      body: Center(
        child: Text("data"),
      ),
    ); // Replace with your desired widget
  }
}
