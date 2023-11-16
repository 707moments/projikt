import 'package:flutter/material.dart';
import 'package:appdevproject/customnavbar.dart';
import 'package:appdevproject/profile_edit_student.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProfileStudent(),
    );
  }
}

class ProfileData {
  final String name;
  final String aboutMe;
  final String email;
  final String phone;
  final String location;

  ProfileData({
    required this.name,
    required this.aboutMe,
    required this.email,
    required this.phone,
    required this.location,
  });
}

class ProfileStudent extends StatelessWidget {
  late final ProfileData profileData;

  ProfileStudent({ProfileData? initialProfileData})
      : profileData = initialProfileData ??
      ProfileData(
        name: 'John Doe',
        aboutMe:
        'I am a passionate software developer with a keen interest in mobile application development.',
        email: 'john.doe@example.com',
        phone: '+1234567890',
        location: 'City, Country',
      );

  void updateProfileData(ProfileData updatedProfileData) {
    // Create a new ProfileData with the updated values
    ProfileData newProfileData = ProfileData(
      name: updatedProfileData.name,
      aboutMe: updatedProfileData.aboutMe,
      email: updatedProfileData.email,
      phone: updatedProfileData.phone,
      location: updatedProfileData.location,
    );
    profileData = newProfileData;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 30.0),
            Text(
              'Profile',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            GestureDetector(
              onTap: () async {
                // Navigate to the edit page and receive changes
                ProfileData updatedProfileData = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditStudent(profileData: profileData),
                  ),
                );

                // Check if changes were made and update the profile
                if (updatedProfileData != null) {
                  // Assuming you have a function to update the profile data in ProfileStudent
                  updateProfileData(updatedProfileData);
                }
              },
              child: Icon(
                Icons.settings,
                color: Colors.black,
              ),
            ),

          ],
        ),
        toolbarHeight: 80.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            SizedBox(height: 20.0),
            Text(
              profileData.name,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'About Me',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                profileData.aboutMe,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            Divider(),
            SizedBox(height: 20.0),
            Text(
              'Contact Information',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email: ${profileData.email}'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone: ${profileData.phone}'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Location: ${profileData.location}'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}