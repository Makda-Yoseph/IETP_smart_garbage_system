import 'package:flutter/material.dart';
import 'package:ietp_project/feautures/pages/History_page.dart';
import 'package:ietp_project/feautures/pages/garbage_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Smart Garbage System',
              style: TextStyle(color: Colors.black, fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.delete),
                text: 'Garbage Level',
              ),
              Tab(
                icon: Icon(Icons.access_time),
                text: 'History',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GarbagePage(),
            HistoryPage(),
          ],
        ),
      ),
    );
  }
}
