import 'package:flutter/material.dart';

class PaymentScreen2 extends StatelessWidget {
  final String tutorName;

  PaymentScreen2(this.tutorName);

  @override
  Widget build(BuildContext context) {
    // Use your preferred color code

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pay Tutor',
          style: TextStyle(
              fontFamily: 'Bebas', fontSize: 30, fontWeight: FontWeight.w400),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pay To:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          tutorName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text('Card 2'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text('Card 3'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
