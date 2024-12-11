import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Smart Garbage System',
          style: TextStyle(color: Colors.black, fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Card(
              child: ListTile(
                title: Text('Plastic wastes'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('50%'),
                    SizedBox(height: 5),
                    _buildLevelIndicator(50),
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Non-plastic wastes'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('90%'),
                    SizedBox(height: 5),
                    _buildLevelIndicator(90),
                  ],
                ),
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
    } else if (percentage <= 60) {
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
