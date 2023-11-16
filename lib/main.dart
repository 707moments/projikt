import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:appdevproject/payment3.dart';
import 'package:appdevproject/paymentscreen.dart';
import 'package:appdevproject/view_screen_tutor.dart';
import 'package:appdevproject/loginscreen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:animations/animations.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:appdevproject/customnavbar.dart';
import 'package:appdevproject/schedule_screen.dart';
import 'package:appdevproject/chat_contacts.dart';
import 'package:appdevproject/chat_screen.dart';
import 'package:appdevproject/profile_student.dart';
import 'package:appdevproject/profile_edit_student.dart';

void main() => runApp(const YOUAI());

class YOUAI extends StatefulWidget {
  const YOUAI({Key? key}) : super(key: key);

  @override
  State<YOUAI> createState() => _YOUAIState();
}

class _YOUAIState extends State<YOUAI> {
  bool isDark = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/chat': (context) => ChatContacts(),
        '/chatScreen': (context) => ChatScreen(userName: '',),
        '/schedule': (context) => ScheduleScreen(),
        '/profile': (context) => ProfileStudent(),
        '/payment': (context) => PaymentScreen(),
        '/p3': (context) => Payment3(),
      },
    );
  }

  Widget HomeScreen() {
    Color bottomNavBarColor = Colors.grey[100]!;
    Color iconColor = Colors.black;

    List<UserInfo> users = [
      UserInfo(
        name: "Ezra Sebastian",
        role: "Math Tutor",
        description: "Sample description",
        imageUrl:
            'https://imageio.forbes.com/specials-images/imageserve/646a275546cda47733a0589b/Lee-Do-hyun/0x0.jpg?format=jpg&crop=1000,905,x0,y123,safe&width=960',
      ),
      UserInfo(
        name: "Mr. Ming",
        role: "Meowing 101",
        description: "Sample description",
        imageUrl:
            "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSGfpQ3m-QWiXgCBJJbrcUFdNdWAhj7rcUqjeNUC6eKcXZDAtWm",
      )
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: SearchAnchor(
                      builder: (BuildContext context, SearchController controller) {
                        return SearchBar(
                          controller: controller,
                          padding: const MaterialStatePropertyAll<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 16.0),
                          ),
                          onTap: () {
                            controller.openView();
                          },
                          onChanged: (_) {
                            controller.openView();
                          },
                          leading: const Icon(Icons.search),
                        );
                      },
                      suggestionsBuilder: (BuildContext context, SearchController controller) {
                        return List<ListTile>.generate(5, (int index) {
                          final String item = 'item $index';
                          return ListTile(
                            title: Text(item),
                            onTap: () {
                              setState(() {
                                controller.closeView(item);
                              });
                            },
                          );
                        });
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.filter_list),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            for (var user in users)
              ExpandableCard(
                user: user,
              ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

class UserInfo {
  final String name;
  final String role;
  final String description;
  final String imageUrl;

  UserInfo({
    required this.name,
    required this.role,
    required this.description,
    required this.imageUrl,
  });
}

class ExpandableCard extends StatelessWidget {
  final UserInfo user;

  ExpandableCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fade,
      transitionDuration: const Duration(milliseconds: 500),
      openBuilder: (BuildContext context, VoidCallback openContainer) {
        return FullScreenCard(user: user);
      },
      closedBuilder: (BuildContext context, VoidCallback openContainer) {
        return Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image(
                      image: NetworkImage(user.imageUrl),
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                    Container(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(height: 5),
                          Text(
                            user.name,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Container(height: 5),
                          Text(
                            user.role,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.grey[500],
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            user.description,
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class FullScreenCard extends StatelessWidget {
  final UserInfo user;

  FullScreenCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image(
                  image: NetworkImage(user.imageUrl),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                Container(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(height: 5),
                      Text(
                        user.name,
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Container(height: 5),
                      Text(
                        user.role,
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.grey[500],
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        user.description,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Sample Text:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Sample description",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: <Widget>[
                TextButton(
                  child: const Text(
                    "Call",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {},
                ),
                TextButton(
                  child: const Text(
                    "Message",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
