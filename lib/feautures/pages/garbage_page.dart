import 'package:flutter/material.dart';
// import 'package:ietp_project/feautures/pages/garbage_detail_page.dart';
import 'garbage_detail_page.dart';

class GarbagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => garbageDetailPage()),
          );
        },
        child: ClipRect(
          child: Container(
            color: Colors.brown[200],
            width: double.infinity,
            height: 100,
            child: Center(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delete,
                      size: 30,
                    ),
                    Text('Yeka Sub-City garbage',
                        style: TextStyle(fontSize: 22))
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
