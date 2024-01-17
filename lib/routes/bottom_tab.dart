import 'package:example/view/main/index.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({Key? key}) : super(key: key);

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
    const MediaManagement(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedIconTheme: const IconThemeData(color: Color(0xffFF5E00)),
        selectedItemColor: const Color(0xffFF5E00),
        selectedLabelStyle: const TextStyle(color: Color(0xffFF5E00)),
        
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
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.amber,
            icon: Icon(Icons.work),
            label: 'Đối tác',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.amber,
            icon: Icon(Icons.work),
            label: 'Lịch',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.amber,
            icon: Icon(Icons.work),
            label: 'CTKM',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.amber,
            icon: Icon(Icons.work),
            label: 'Đơn hàng',
          ),
        ],
      ),
    );
  }
}
