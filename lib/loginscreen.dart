import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:animations/animations.dart';

void main() {
  runApp(LoginScreen());
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final List<String> items = ['Tutor', 'Pupil'];
  String? selectedValue = "Pupil";

  void handleAvatarTap(int avatarIndex) {
    print('Avatar $avatarIndex clicked'); //testing
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Lorthew',
                style: TextStyle(
                    fontFamily: 'Bebas',
                    fontSize: 40,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 10),
              ClipOval(
                child: SizedBox.fromSize(
                  size: Size.fromRadius(48),
                  child: Image.asset(
                    'assets/images/what.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                color: Color.fromRGBO(244, 182, 38, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              handleAvatarTap(0);
                            },
                            child: CircleAvatar(
                              backgroundColor: Color.fromRGBO(16, 48, 89, 1),
                              radius: 30,
                              child: ClipOval(
                                child:
                                    Image.asset('assets/images/myidolo2.jpg'),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              handleAvatarTap(1);
                            },
                            child: CircleAvatar(
                              backgroundColor: Color.fromRGBO(16, 48, 89, 1),
                              radius: 30,
                              child: ClipOval(
                                child:
                                    Image.asset('assets/images/myidolo2.jpg'),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              handleAvatarTap(2);
                            },
                            child: CircleAvatar(
                              backgroundColor: Color.fromRGBO(16, 48, 89, 1),
                              radius: 30,
                              child: ClipOval(
                                child:
                                    Image.asset('assets/images/myidolo2.jpg'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        'OR',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Login with your email and password:',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.grey[200],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.grey[200],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            border: InputBorder.none,
                          ),
                          obscureText: true,
                        ),
                      ),
                      SizedBox(height: 20),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: const Row(
                            children: [
                              Icon(
                                Icons.list,
                                size: 16,
                                color: Colors.yellow,
                              ),
                              SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  'Select',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellow,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          items: items
                              .map((String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (String? value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                          buttonStyleData: ButtonStyleData(
                            height: 50,
                            width: 400,
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: Colors.black26,
                              ),
                              color: const Color.fromRGBO(16, 48, 89, 1),
                            ),
                            elevation: 2,
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.arrow_forward_ios_outlined,
                            ),
                            iconSize: 14,
                            iconEnabledColor: Colors.yellow,
                            iconDisabledColor: Colors.grey,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 200,
                            width: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: const Color.fromRGBO(16, 48, 89, 1),
                            ),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all<double>(6),
                              thumbVisibility:
                                  MaterialStateProperty.all<bool>(true),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                            padding: EdgeInsets.only(left: 14, right: 14),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      AnimatedButton(
                        height: 40,
                        width: 200,
                        text: 'LOGIN',
                        isReverse: true,
                        selectedTextColor: Colors.black,
                        transitionType: TransitionType.LEFT_TO_RIGHT,
                        backgroundColor: Color.fromRGBO(16, 48, 89, 1),
                        borderColor: Colors.white,
                        borderRadius: 50,
                        borderWidth: 2,
                        onPress: () {
                          Navigator.pushNamed(context, '/home');
                        },
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Color.fromRGBO(16, 48, 89, 1),
                        ),
                        child: Text(
                          "Don't have an account? Click here to Register",
                          style: TextStyle(fontFamily: 'Bebas'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ).animate().fadeIn().scale().move(delay: 500.ms, duration: 600.ms),
      ),
    );
  }
}
