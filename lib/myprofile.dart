import 'package:appdevproject/profile_student.dart';
import 'package:flutter/material.dart';
import 'package:appdevproject/schedule_student.dart';
import 'package:appdevproject/customnavbar.dart';
import 'package:appdevproject/schedule_tutor.dart';
import 'package:appdevproject/profile_edit_student.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile Navbar'),
          backgroundColor: Colors.white,
        ),
        body: MyProfile(),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  late ProfileData profileData;

  @override
  void initState() {
    super.initState();
    profileData = ProfileData(
      firstName: 'John',
      lastName: 'Doe',
      aboutMe: 'I am a passionate software developer...',
      email: 'john.doe@example.com',
      phone: '+1234567890',
      location: 'City, Country',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child:
          Text(
            'My Profile',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        toolbarHeight: 75.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                      'https://placekitten.com/200/200'
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${profileData.firstName} ${profileData.lastName}',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '${profileData.email}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              // Open the profile edit screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StudentEdit(
                                    profileData: profileData,
                                    onUpdate: (ProfileData updatedData) {
                                      // Update the profile data if needed
                                      setState(() {
                                        profileData = updatedData;
                                      });
                                    },
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFDD835),
                            ),
                            icon: Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                            label: Text(
                              'Edit Profile',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfileStudent(profileData: profileData),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFDD835),
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(12),
                            ),
                            child: Icon(
                              Icons.visibility,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 24),
                  _buildSessionsBox(context),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFDD835),
                    ),
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }

  Widget _buildSessionsBox(BuildContext context) {
    int sessionsCount = 3;

    String greeting;
    var hour = DateTime.now().hour;
    if (hour < 12) {
      greeting = 'Good Morning';
    } else if (hour < 17) {
      greeting = 'Good Afternoon';
    } else {
      greeting = 'Good Evening';
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ScheduleStudent()),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16),
        width: 500,
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$greeting,',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25),
            Center(
              child: Text(
                'You have $sessionsCount Sessions today.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 25),
            Text(
              'Click to view.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
