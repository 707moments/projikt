import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:appdevproject/customnavbar.dart';

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
            const SizedBox(
              width: 48.0,
              height: 48.0,
            ),
            const Center(
              child: Text(
                'Profile',
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
            const CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage('ProfileImageURL'),
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
            const SizedBox(height: 10.0,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'I am a passionate software developer with a keen interest in mobile application development.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
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
            const SizedBox(height: 10.0),
            const ListTile(
              leading: Icon(Icons.email),
              title: Text('Email: john.doe@example.com'),
            ),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone: +1234567890'),
            ),
            const ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Location: City, Country'),
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
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFFDD835)),
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
                      Icon(LineIcons.calendarAlt, color: Colors.black),
                      SizedBox(width: 10),
                      Text(
                        'Schedule a Lesson',
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
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

