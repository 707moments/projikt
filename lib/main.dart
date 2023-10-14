import 'package:flutter/material.dart';
import 'package:flutter_application_1/loginscreen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:animations/animations.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() => runApp(const YOUAI());

class YOUAI extends StatefulWidget {
  const YOUAI({super.key});

  @override
  State<YOUAI> createState() => _YOUAIState();
}

class _YOUAIState extends State<YOUAI> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(), //test
        '/home': (context) => HomeScreen(), // test
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
        description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam",
        imageUrl: 'https://imageio.forbes.com/specials-images/imageserve/646a275546cda47733a0589b/Lee-Do-hyun/0x0.jpg?format=jpg&crop=1000,905,x0,y123,safe&width=960',
      ),
      UserInfo(
        name: "Mr. Ming", 
        role: "Meowing 101", 
        description: "Professional Meowth master since birth", 
        imageUrl: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSGfpQ3m-QWiXgCBJJbrcUFdNdWAhj7rcUqjeNUC6eKcXZDAtWm"
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
                          padding: const MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(horizontal: 16.0)),
                          onTap: () {
                            controller.openView();
                          },
                          onChanged: (_) {
                            controller.openView();
                          },
                          leading: const Icon(Icons.search),
                          trailing: <Widget>[
                            Tooltip(
                              message: 'Change brightness mode',
                              child: IconButton(
                                isSelected: isDark,
                                onPressed: () {
                                  setState(() {
                                    isDark = !isDark;
                                  });
                                },
                                icon: const Icon(Icons.wb_sunny_outlined),
                                selectedIcon: const Icon(Icons.brightness_2_outlined),
                              ),
                            )
                          ],
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
      bottomNavigationBar: GNav(
        rippleColor: Colors.grey[300]!,
        hoverColor: Colors.grey[100]!,
        tabActiveBorder: Border.all(color: Color(0xff4cc55c), width: 1),
        gap: 8,
        activeColor: iconColor,
        iconSize: 24,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        duration: Duration(milliseconds: 400),
        tabBackgroundColor: bottomNavBarColor,
        tabs: [
          GButton(
            icon: LineIcons.home,
            text: 'Home',
          ),
          GButton(
            icon: LineIcons.commentAlt,
            text: 'Chat',
            //onPressed: () {
              //Navigator.pushNamed(context, '/chat'); 
            //},
          ),
          GButton(
            icon: LineIcons.receipt,
            text: 'Pay',
            //onPressed: () {
              //Navigator.pushNamed(context, '/pay'); 
            //},
          ),
          GButton(
            icon: LineIcons.user,
            text: 'Profile',
            //onPressed: () {
              //Navigator.pushNamed(context, '/profile'); 
            //},
          ),
        ],
      ),
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
        return FullScreenCard(user: user); // Implement the FullScreenCard widget
      },
      closedBuilder: (BuildContext context, VoidCallback openContainer) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
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
                              color: Colors.grey[80],
                            ),
                          ),
                          Container(height: 5),
                          Text(
                            user.role,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.grey[500],
                            ),
                          ),
                          Text(
                            user.description,
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.grey[500],
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
                          color: Colors.grey[80],
                        ),
                      ),
                      Container(height: 5),
                      Text(
                        user.role,
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.grey[500],
                        ),
                      ),
                      Text(
                        user.description,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.grey[500],
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
                      "Di ko alam ilalagay:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Baka buttons for other shit",
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
                    ),
                  ),
                  onPressed: () {},
                ),
                TextButton(
                  child: const Text(
                    "Message",
                    style: TextStyle(
                      color: Colors.blue,
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
