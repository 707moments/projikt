import 'package:flutter/material.dart';
//login screen?
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: () { 
            Navigator.pushNamed(context, '/chat');
          },
          child: const Text('Test pabalik to homescreen'),
        ),
      ),
    );
  }
}
