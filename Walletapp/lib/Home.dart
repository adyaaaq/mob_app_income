import 'package:flutter/material.dart';
import 'package:walletapp/screens/AddCart.dart';
import 'package:walletapp/screens/Expenses.dart';
import 'package:walletapp/screens/Main/Analysis.dart';
import 'package:walletapp/screens/Main/HomePage.dart';
import 'package:walletapp/screens/Main/Profile.dart';
import 'package:walletapp/screens/Main/Wallet.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _pages = [HomePage(), Analysis(), Wallet(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Addcart()),
                );
              },
              backgroundColor:
                  const Color(0xFF2F7E79), // Circle background color
              shape: const CircleBorder(), // Ensures the button is circular
              child: const Icon(
                Icons.add,
                size: 32,
                color: Colors.white, // PLUS icon color is white
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor:
            const Color(0xFF2F7E79), // Color for the selected icon
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
