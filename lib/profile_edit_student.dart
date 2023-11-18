import 'package:appdevproject/profile_student.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:psgc_picker/psgc_picker.dart';

class EditStudent extends StatelessWidget {
  final ProfileData profileData;
  final Function(ProfileData) onUpdate;

  EditStudent({required this.profileData, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return StudentEdit(
      profileData: profileData,
      onUpdate: onUpdate,
    );
  }
}

class StudentEdit extends StatefulWidget {
  final ProfileData profileData;
  final Function(ProfileData) onUpdate;

  StudentEdit({required this.profileData, required this.onUpdate});

  @override
  _StudentEditState createState() => _StudentEditState();
}

class _StudentEditState extends State<StudentEdit> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _aboutMeController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _locationController;

  @override
  void initState() {
    super.initState();

    _firstNameController = TextEditingController(text: widget.profileData.firstName);
    _lastNameController = TextEditingController(text: widget.profileData.lastName);
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
            SizedBox(width: 75.0),
          ],
        ),
        toolbarHeight: 80.0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 25.0),
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

                  },
                ),
              ),
              SizedBox(height: 10.0),
              buildEditableField("First Name", _firstNameController, maxLength: 50, textAlign: TextAlign.left),
              buildEditableField("Last Name", _lastNameController, maxLength: 50, textAlign: TextAlign.left),
              buildEditableField("About Me", _aboutMeController, maxLines: 6, textAlign: TextAlign.left),
              buildEditableField("Email", _emailController, maxLength: 50, textAlign: TextAlign.left),
              buildEditableField("Phone", _phoneController, textAlign: TextAlign.left),
              buildEditableField("Location", _locationController, textAlign: TextAlign.left),
              SizedBox(height: 50.0),
              SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    var updatedProfileData = ProfileData(
                      firstName: _firstNameController.text,
                      lastName: _lastNameController.text,
                      aboutMe: _aboutMeController.text,
                      email: _emailController.text,
                      phone: _phoneController.text,
                      location: _locationController.text,
                    );

                    widget.onUpdate(updatedProfileData);

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
                          'Save',
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
      {int maxLines = 1, TextAlign textAlign = TextAlign.left, int maxLength = 160}) {
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
          Container(
            width: 280,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              controller: controller,
              maxLines: maxLines,
              textAlign: textAlign,
              maxLength: maxLength,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter your $label',
                fillColor: Colors.grey[200],
                hintStyle: TextStyle(fontSize: 14.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
