import 'package:flutter/material.dart';
import '../components/card.dart';

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
   
    _selectedIndex = index;
    
  }

  static const List<Map> data = [
    {
      'id': '1',
      'name': 'Egg Paprica',
      'image': 'lib/src/assets/images/item1.png',
      'price': '2.00 USD',
    },
    {
      'id': '2',
      'name': 'Beef Burger',
      'image': 'lib/src/assets/images/item2.png',
      'price': '3.00 USD'
    },
    {
      'id': '3',
      'name': 'Rice Bowl',
      'image': 'lib/src/assets/images/item3.png',
      'price': '3.50 USD'
    },
    {
      'id': '4',
      'name': 'Pizza',
      'image': 'lib/src/assets/images/item4.png',
      'price': '5.00 USD'
    }, 
    {
      'id': '5',
      'name': 'Pizza',
      'image': 'lib/src/assets/images/item1.png',
      'price': '5.00 USD'
    }, 
    {
      'id': '6',
      'name': 'Pizza',
      'image': 'lib/src/assets/images/item1.png',
      'price': '5.00 USD'
    }, 
    {
      'id': '7',
      'name': 'Pizza',
      'image': 'lib/src/assets/images/item1.png',
      'price': '5.00 USD'
    }, 
    {
      'id': '8',
      'name': 'Pizza',
      'image': 'lib/src/assets/images/item1.png',
      'price': '5.00 USD'
    }, 
    {
      'id': '9',
      'name': 'Pizza',
      'image': 'lib/src/assets/images/item1.png',
      'price': '5.00 USD'
    }, 
    {
      'id': '10',
      'name': 'Pizza',
      'image': 'lib/src/assets/images/item1.png',
      'price': '5.00 USD'
    }, 
    {
      'id': '11',
      'name': 'Pizza',
      'image': 'lib/src/assets/images/item1.png',
      'price': '5.00 USD'
    }, 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
        actions: [
          IconButton(
            style: TextButton.styleFrom(padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle the search button press
            },
          ),
        ],
        
      ),
        
      drawer: Drawer(
        
        surfaceTintColor: Colors.red,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
              },
            ),
            ListTile(
              title: const Text('Business'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
              },
            ),
            ListTile(
              title: const Text('School'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(14),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.black, size: 24,),
                      Text('Ha Noi', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),)
                    ],
                  ),
                  Text('Choose your preferred meal', style: TextStyle(color: Color.fromARGB(69, 33, 33, 22), fontSize: 12),),
                ]
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(14, 10, 14, 70),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  crossAxisSpacing: 8.0, 
                  mainAxisSpacing: 8.0, 
                ),
                itemCount: data.length, 
                itemBuilder: (BuildContext context, int index) {
                  //print(data[index].runtimeType);
                  return HomeCard(
                    item: data[index],
                  );
                },
              ),
            ),
        ]),
      ),
    );
  }



}



