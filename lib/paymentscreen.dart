import 'package:appdevproject/customnavbar.dart';
import 'package:flutter/material.dart';
import 'package:appdevproject/payment2.dart';

/*
TODO:
1. Hiwalay ang hover to another dart file
2. Find a better way to improve visibility sa list
3. Better hover animation, current one sucks and feels slow and janky
*/

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final List<String> items = [
    'John Smith', 'Alice Johnson', 'Bob Brown', 'Sarah Davis', 'Michael Wilson',
    'Emily Evans', 'Daniel Anderson', 'Paolo Banchero', 'Jacob Taylor', 'Ava White',
    'Ethan Harris', 'Sophia Clark', 'Mia Lewis', 'Noah Hall', 'Charlotte Young',
    'Liam Turner', 'Amelia Walker', 'Harper Harris', 'Evelyn Jackson', 'Logan White',
    'Abigail Scott', 'Elijah Adams', 'Elizabeth Baker', 'James Lewis', 'Sofia Wright',
    'Grace King', 'Lucas Mitchell', 'Chloe Lee', 'Benjamin Green', 'Victoria Carter',
    'Henry Hill', 'Lily Morris', 'Zoe Phillips', 'Aiden Cook', 'Nora Parker', 'Hannah Hall',
    'Lionel Messi', 'Grace Bell', 'Ella Murphy', 'Alexander Stewart', 'Avery Scott',
    'William Hughes', 'Scarlett Edwards', 'Aaron James', 'Oliver Howard', 'Addison Ward',
    'Lucy Price', 'Michael Rogers', 'Natalie Long', 'Brooklyn Collins', 'David Foster',
    'Anna Reed', 'Victoria Miller', 'Sophia Sanders', 'James Bennett', 'Ella Gray',
    'Aria Russell', 'Joseph Hayes', 'Layla Reed', 'Luna Sanders', 'Daniel Rivera', 'Mila Ward',
    'Aurora Scott', 'Adolf Hitler', 'Penelope Turner', 'Hazel Perez', 'Christopher Ross',
    'Zoe Rivera', 'Aubrey Coleman', 'Evelyn Patterson', 'Lydia Simmons', 'Samuel Murphy',
    'Claire Turner', 'Audrey Henderson', 'Eli Wood', 'Skylar Ivorra', 'Lebron James',
    'Joshua Brooks', 'Paisley Phillips', 'Lillian Hayes', 'Isaac Simmons', 'Charlie Wright',
    'Aaliyah Wright',
  ];

  int? selectedItemIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pay Tutor',
        style: TextStyle(
                    fontFamily: 'Bebas',
                    fontSize: 30,
                    fontWeight: FontWeight.w400),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.history,
              color: Color.fromRGBO(16, 48, 89, 1),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Color.fromRGBO(16, 48, 89, 1),
            ),
            onPressed: () {},
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: "Tentative Search Bar",
                fillColor: Colors.white70,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedItemIndex = index;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentScreen2(items[index]),
                      ),
                    );
                  },
                  child: MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        selectedItemIndex = index;
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        selectedItemIndex = null;
                      });
                    },
                    child: Container(
                      color: selectedItemIndex == index ? Color.fromARGB(255, 15, 26, 122) : null,
                      child: ListTile(
                        title: Text(
                          items[index],
                          style: TextStyle(
                            color: selectedItemIndex == index ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
