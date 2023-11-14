import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _messages = [];

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _messages.add(text);
    });
  }

  Widget _buildTextComposer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration.collapsed(
                hintText: 'Enter your message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            color: Colors.yellow, // Set send icon color to yellow
            onPressed: () {
              if (_textController.text.isNotEmpty) {
                _handleSubmitted(_textController.text);
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Set app bar background color to white
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black, // Set back icon color to black
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.phone),
            color: Colors.black, // Set phone icon color to black
            onPressed: () {
              // Add functionality for phone icon
            },
          ),
        ],
        title: Row(
          children: [
            CircleAvatar(
              // Use CircleAvatar as the title
              backgroundColor:
                  Colors.blue, // Set the background color of the CircleAvatar
              child: Text(
                'U', // You can put your initials or any desired text here
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              width: 8,
            ), // Add some space between the avatar and the name
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tutor Name', // Replace 'Tutor Name' with the actual tutor's name
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  'Physics Tutor', // Add another text for the tutor's specialization
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0, // Remove shadow from the app bar
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildMessage(_messages[index]);
              },
            ),
          ),
          Divider(height: 1.0),
          _buildTextComposer(),
        ],
      ),
    );
  }

  Widget _buildMessage(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              child: Text('User'),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'User',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text(text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
