import 'package:flutter/material.dart';
import 'package:homeline/favourite.dart';
import 'package:homeline/home.dart';
import 'package:homeline/message.dart';
import 'package:homeline/account.dart';
import 'package:homeline/search.dart';

class Seventhscreen extends StatefulWidget {
  const Seventhscreen({super.key});

  @override
  State<Seventhscreen> createState() => _SeventhscreenState();
}

class _SeventhscreenState extends State<Seventhscreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Search(),
    Favourite(),
    Message(),
    Account()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favourite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.message_rounded), label: 'Message'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_4_rounded,
              ),
              label: 'Account')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.black87,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
