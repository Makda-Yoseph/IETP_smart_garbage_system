import 'dart:ffi';

import 'package:flutter/material.dart';

class garbageDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Garbage Detail level '),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              child: Card(
                color: Colors.blue[100],
                child: ListTile(
                  title: Text(
                    'Plastic Wastes',
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Waste level is: 50%'),
                      SizedBox(height: 5),
                      _buildLevelIndicator(50),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Clear Garbage'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 100,
              child: Card(
                color: Colors.brown[100],
                child: ListTile(
                  title: Text(
                    'Non-Plastic Wastes',
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Column(
                    children: [
                      Text('Waste level is: 90%'),
                      SizedBox(height: 5),
                      _buildLevelIndicator(90),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {},
              child: Text('Clear Garbage'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLevelIndicator(int percentage) {
    Color color;
    if (percentage <= 30) {
      color = Colors.green;
    } else if (percentage <= 70) {
      color = Colors.yellow;
    } else {
      color = Colors.red;
    }

    return LinearProgressIndicator(
      value: percentage / 100,
      backgroundColor: Colors.grey[300],
      valueColor: AlwaysStoppedAnimation<Color>(color),
    );
  }
}
