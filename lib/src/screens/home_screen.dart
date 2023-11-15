import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  //const HomeScreen({super.key});
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('zz')),
      
      body: SafeArea(
        child: Column(
          children: [
            Text('hung')
        ]),
      ),
    );
  }
  
  void setState(Null Function() param0) {}


}

