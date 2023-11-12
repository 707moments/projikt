import 'package:appdevproject/customnavbar.dart';
import 'package:flutter/material.dart';

class Payment3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Center(
        child: Container(
          width: 500.0, // Adjust the width as needed
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 50.0,
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Payment Success!',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      'Amount Paid:',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      '\u20B1 1000',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Bebas',
                        color: Color.fromRGBO(16, 48, 89, 1),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      'Reference Number:',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      '99999999999999999',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      'Payment Time:',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      'Date and Time',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      'Payment Method:',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      'GCASH',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      'Client Name:',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      'Client Name',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    ElevatedButton(
                      onPressed: () {
                        // Add logic to download receipt
                      },
                      child: Text('Download Receipt'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}