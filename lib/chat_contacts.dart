import 'package:flutter/material.dart';
import 'package:appdevproject/customnavbar.dart';
import 'package:appdevproject/chat_screen.dart';

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Chat UI',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
        ),
      ),
      home: ChatContacts(),
    );
  }
}

class ChatContacts extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatContacts> {
  final Map<String, String> users = {
    'Alice': 'Physics Tutor Alice',
    'Bob': 'Math Tutor Bob',
    'Charlie': 'English Tutor Charlie',
    // Add more users and their corresponding tutor names as needed
  };

  List<String> filteredUsers = [];

  @override
  void initState() {
    super.initState();
    filteredUsers = users.keys.toList(); // Use keys.toList() to get a list of user names
  }

  void _filterUsers(String query) {
    setState(() {
      filteredUsers = users.keys
          .where((user) => user.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Chats',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true, // Aligns the title in the center of the AppBar
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.yellow,
              ),
              onPressed: () {
                // Add functionality for the notification icon
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search users...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: _filterUsers,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(filteredUsers[index][0]),
                  ),
                  title: Text(filteredUsers[index]),
                  onTap: () {
                    _navigateToChatScreen(context, filteredUsers[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }

  void _navigateToChatScreen(BuildContext context, String userName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(userName: userName),
      ),
    );
  }

}
