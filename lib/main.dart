import 'package:flutter/material.dart';
import 'package:flutter_application_1/secondscreen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

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
        '/': (context) => SecondScreen(), //test
        '/chat': (context) => HomeScreen(),   // test
        //'/pay': (context) => PayScreen(),    
        //'/profile': (context) => ProfileScreen(), 
      },
    );
  }
  Widget HomeScreen(){
    Color bottomNavBarColor = Colors.grey[100]!;
    Color iconColor = Colors.black;
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
                          builder: (BuildContext context,
                              SearchController controller) {
                            return SearchBar(
                              controller: controller,
                              padding:
                                  const MaterialStatePropertyAll<EdgeInsets>(
                                      EdgeInsets.symmetric(horizontal: 16.0)),
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
                                    selectedIcon:
                                        const Icon(Icons.brightness_2_outlined),
                                  ),
                                )
                              ],
                            );
                          },
                          suggestionsBuilder: (BuildContext context,
                              SearchController controller) {
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
                Card(
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
                              image: NetworkImage(
                                  'https://imageio.forbes.com/specials-images/imageserve/646a275546cda47733a0589b/Lee-Do-hyun/0x0.jpg?format=jpg&crop=1000,905,x0,y123,safe&width=960'),
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
                                    "Ezra Sebastian",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey[80],
                                    ),
                                  ),
                                  Container(height: 5),
                                  Text(
                                    "Math Tutor",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam",
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  Center(
                                    child: Row(
                                      children: <Widget>[
                                        const Spacer(),
                                        TextButton(
                                          child: const Text(
                                            "Call",
                                            style: TextStyle(
                                                color: Colors.amberAccent),
                                          ),
                                          onPressed: () {},
                                        ),
                                        TextButton(
                                          child: const Text(
                                            "Message",
                                            style: TextStyle(
                                                color: Colors.amberAccent),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Card(
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
                              image: NetworkImage(
                                  'https://assets.vogue.com/photos/5cf7ed4504f90a017a26d60f/1:1/w_2291,h_2291,c_limit/5-things-to-know-about-margot-robbie.jpg'),
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
                                    "Dahlia Clemency",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey[80],
                                    ),
                                  ),
                                  Container(height: 5),
                                  Text(
                                    "Physics Tutor",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam",
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  Center(
                                    child: Row(
                                      children: <Widget>[
                                        const Spacer(),
                                        TextButton(
                                          child: const Text(
                                            "Call",
                                            style: TextStyle(
                                                color: Colors.amberAccent),
                                          ),
                                          onPressed: () {},
                                        ),
                                        TextButton(
                                          child: const Text(
                                            "Message",
                                            style: TextStyle(
                                                color: Colors.amberAccent),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Card(
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
                              image: NetworkImage(
                                  'https://m.media-amazon.com/images/M/MV5BNGJmMWEzOGQtMWZkNS00MGNiLTk5NGEtYzg1YzAyZTgzZTZmXkEyXkFqcGdeQXVyMTE1MTYxNDAw._V1_.jpg'),
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
                                    "Lucius Mattie",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey[80],
                                    ),
                                  ),
                                  Container(height: 5),
                                  Text(
                                    "Discrete Math Tutor",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam",
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  Center(
                                    child: Row(
                                      children: <Widget>[
                                        const Spacer(),
                                        TextButton(
                                          child: const Text(
                                            "Call",
                                            style: TextStyle(
                                                color: Colors.amberAccent),
                                          ),
                                          onPressed: () {},
                                        ),
                                        TextButton(
                                          child: const Text(
                                            "Message",
                                            style: TextStyle(
                                                color: Colors.amberAccent),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Card(
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
                              image: NetworkImage(
                                  'https://static.independent.co.uk/2023/06/02/09/newFile-1.jpg?width=1200&height=1200&fit=crop'),
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
                                    "Maxie Robby",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey[80],
                                    ),
                                  ),
                                  Container(height: 5),
                                  Text(
                                    "Biology Tutor",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam",
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  Center(
                                    child: Row(
                                      children: <Widget>[
                                        const Spacer(),
                                        TextButton(
                                          child: const Text(
                                            "Call",
                                            style: TextStyle(
                                                color: Colors.amberAccent),
                                          ),
                                          onPressed: () {},
                                        ),
                                        TextButton(
                                          child: const Text(
                                            "Message",
                                            style: TextStyle(
                                                color: Colors.amberAccent),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Card(
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
                              image: NetworkImage(
                                  'https://m.media-amazon.com/images/M/MV5BYWU2ZmUyOTctNjE0Zi00N2Q3LTk1ZmYtMzAxMDRmNmM3OTFhXkEyXkFqcGdeQXVyNjU1Nzk5NTE@._V1_.jpg'),
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
                                    "Laurie Jeane",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey[80],
                                    ),
                                  ),
                                  Container(height: 5),
                                  Text(
                                    "Statistics Tutor",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam",
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  Center(
                                    child: Row(
                                      children: <Widget>[
                                        const Spacer(),
                                        TextButton(
                                          child: const Text(
                                            "Call",
                                            style: TextStyle(
                                                color: Colors.amberAccent),
                                          ),
                                          onPressed: () {},
                                        ),
                                        TextButton(
                                          child: const Text(
                                            "Message",
                                            style: TextStyle(
                                                color: Colors.amberAccent),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
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
