

import 'package:example/view/main/index.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({super.key});

  @override
  _BottomTabPageState createState() => _BottomTabPageState();
}

class _BottomTabPageState extends State<BottomTab> {
  int _currentIndex = 0;

  // Danh sách các tab
  final List<Widget> _tabs = [
    const Home(),
    const Timekeeping(),
    const Log(),
    const MediaManagement(),
  
    
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.amber,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.amber,
            icon: Icon(Icons.touch_app),
            label: 'Attendance',
            
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.amber,
            icon: Icon(Icons.filter_1),
            label: 'Test',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.amber,
            icon: Icon(Icons.person),
            label: 'Menu',
          ),
        ],
      ),
    );
  }
}

