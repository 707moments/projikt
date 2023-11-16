import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:appdevproject/profile_student.dart';

void main() {
  var initialProfileData;
  runApp(
    MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: EditStudent(profileData: initialProfileData),
    ),
  );
}

class EditStudent extends StatelessWidget {
  final ProfileData profileData;

  EditStudent({required this.profileData});

  @override
  Widget build(BuildContext context) {
    return StudentEdit(profileData: profileData, onProfileUpdated: (ProfileData updatedProfileData) {  },);
  }
}

class StudentEdit extends StatefulWidget {
  final ProfileData profileData;
  final Function(ProfileData updatedProfileData) onProfileUpdated;

  StudentEdit({required this.profileData, required this.onProfileUpdated});

  @override
  _ProfileStudentState createState() => _ProfileStudentState();
}

class _ProfileStudentState extends State<StudentEdit> {
  late TextEditingController _nameController;
  late TextEditingController _aboutMeController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _locationController;

  @override
  void initState() {
    super.initState();

    // Initialize controllers with values from profileData
    _nameController = TextEditingController(text: widget.profileData.name);
    _aboutMeController = TextEditingController(text: widget.profileData.aboutMe);
    _emailController = TextEditingController(text: widget.profileData.email);
    _phoneController = TextEditingController(text: widget.profileData.phone);
    _locationController = TextEditingController(text: widget.profileData.location);
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
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: (Color(0xFFFDD835)),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 70.0),
          ],
        ),
        toolbarHeight: 80.0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(44, 132, 157, 188),
                  shape: BoxShape.circle,
                  image: DecorationImage(image: NetworkImage('Usericon')),
                ),
                child: IconButton(
                  iconSize: 100,
                  splashRadius: 1,
                  icon: const Icon(Icons.add),
                  splashColor: const Color.fromARGB(102, 255, 0, 0),
                  tooltip: "Add/Change your icon.",
                  color: Colors.black,
                  onPressed: () {
                    // Your icon change logic here
                  },
                ),
              ),
              SizedBox(height: 10.0),
              buildEditableField("Name", _nameController, textAlign: TextAlign.right),
              SizedBox(height: 15.0),
              buildEditableField("About Me", _aboutMeController, maxLines: 3, textAlign: TextAlign.right),
              SizedBox(height: 15.0),
              buildEditableField("Email", _emailController, textAlign: TextAlign.right),
              buildEditableField("Phone", _phoneController, textAlign: TextAlign.right),
              buildEditableField("Location", _locationController, textAlign: TextAlign.right),
              SizedBox(height: 20.0),
              SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    ProfileData updatedProfileData = ProfileData(
                      name: _nameController.text,
                      aboutMe: _aboutMeController.text,
                      email: _emailController.text,
                      phone: _phoneController.text,
                      location: _locationController.text,
                    );

                    // Call the callback function to update the profile
                    widget.onProfileUpdated(updatedProfileData);

                    // Close the edit page
                    Navigator.of(context).pop(updatedProfileData);
                  },

                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFDD835)),
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
                        Icon(LineIcons.doubleCheck, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'Done',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEditableField(String label, TextEditingController controller,
      {int maxLines = 1, TextAlign textAlign = TextAlign.left}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                controller: controller,
                maxLines: maxLines,
                textAlign: textAlign,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your $label',
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}