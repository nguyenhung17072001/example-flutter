

import 'package:example/view/main/home.dart';
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
    Home(),
    Home(),
    Home(),
    Home(),
    
    
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
            backgroundColor: Colors.red,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart_fill),
            label: 'Order',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Test',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Menu',
          ),
        ],
      ),
    );
  }
}

