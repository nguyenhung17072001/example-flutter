import 'package:flutter/material.dart';

import '../screens/splash.dart';
import '../screens/login_creen.dart';
import '../screens/home_screen.dart';


class NavigationContainer extends StatelessWidget {
  const NavigationContainer({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        '/login': (context) => const LoginScreen(),
        '/my-tab': (context) => const MyTabBar(),
        '/my-tab/home': (context) => HomeScreen(),  
      },
    );
  }
}




class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

  @override
  _MyTabBarPageState createState() => _MyTabBarPageState();
}

class _MyTabBarPageState extends State<MyTabBar> {
  int _currentIndex = 0;

  // Danh sách các tab
  final List<Widget> _tabs = [
    HomeScreen(),
    Tab2(),
    Tab3(),
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
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
            
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



class Tab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tab 2 Content'),
    );
  }
}

class Tab3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tab 3 Content'),
    );
  }
}


