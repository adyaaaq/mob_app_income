import 'package:flutter/material.dart';
import 'package:walletapp/screens/Expenses.dart';
import 'package:walletapp/screens/Main/Analysis.dart';
import 'package:walletapp/screens/Main/HomePage.dart';
import 'package:walletapp/screens/Main/Wallet.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    Analysis(),
    Wallet(),
    Expenses(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Color(0xFF2F7E79), // Color for the selected icon
        unselectedItemColor: Colors.grey, // Color for the unselected icons

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Түрийвч',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
