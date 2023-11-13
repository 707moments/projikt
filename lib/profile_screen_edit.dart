import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProfileScreen(),
    ),
  );
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileStudent();
  }
}

class ProfileStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () {
                //
              },
            ),
            const SizedBox(
              width: 48.0,
              height: 48.0,
            ),
            const Center(
              child: Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              width: 96.0,
              height: 96.0,
            ),
          ],
        ),
        toolbarHeight: 80.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(44, 132, 157, 188),
                shape: BoxShape.circle,
                image: DecorationImage(image:NetworkImage('Usericon')),
              ),
              child: IconButton(
                iconSize: 100,
                splashRadius: 1,
                icon: const Icon(Icons.add),
                splashColor: const Color.fromARGB(102, 255, 0, 0),
                tooltip: "Add/Change your icon.",
                color: Colors.black,
                onPressed: () {
                  //
                },
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage('ImageURL1'),
                    ),
                    Text("Subject"),
                  ],
                ),
                SizedBox(width: 50.0),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage('ImageURL2'),
                    ),
                    Text("Experience"),
                  ],
                ),
                SizedBox(width: 50.0),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage('ImageURL3'),
                    ),
                    Text("Price"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.star, color: (Color(0xFFFDD835)), size: 40),
                Icon(Icons.star, color: (Color(0xFFFDD835)), size: 40),
                Icon(Icons.star, color: (Color(0xFFFDD835)), size: 40),
                Icon(Icons.star, color: (Color(0xFFFDD835)), size: 40),
                Icon(Icons.star, color: (Color(0xFFFDD835)), size: 40),
              ],
            ),
            const SizedBox(height: 15.0),
            const Text(
              'About Me',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:
                      'I am a passionate software developer with a keen interest in mobile application development.',
                ),
                maxLines: 3,
                minLines: 2,
              ),
            ),
            const SizedBox(height: 15.0),
            const Text(
              'Contact Information',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Column(
              children: <Widget>[
                SizedBox(height: 10.0),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text('Email:'),
                  subtitle: TextField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'john.doe@example.com',
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text('Phone:'),
                  subtitle: TextField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: '+1234567890',
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text('Location:'),
                  subtitle: TextField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'City, Country',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  //
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFFFDD835)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(LineIcons.doubleCheck, color: Colors.black),
                      SizedBox(width: 10),
                      Text(
                        'Done',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          //fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
