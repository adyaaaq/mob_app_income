import 'package:flutter/material.dart';
import 'package:walletapp/components/AccountTab.dart';
import 'package:walletapp/components/Cards.dart';
import 'package:walletapp/components/Tabs.dart';

class Addcart extends StatelessWidget {
  const Addcart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              // Image background
              image: DecorationImage(
                image: AssetImage('bg.png'), // Replace with your image path
                fit: BoxFit.cover, // Makes the image cover the entire container
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 64, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Түрийвч',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF408D87),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.notifications_none, color: Colors.white),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height *
                  0.20, // 15% of screen height for top padding
            ),
            padding: EdgeInsets.only(
              left: 16.0, // 16px for left padding
              right: 16.0, // 16px for right padding
              bottom: 16.0, // 16px for bottom padding
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: TransactionTabs(
                    titles: const ['Картууд', 'Аккаунт'],
                    tabContents: const [
                      CardsTab(),
                      AccountTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
