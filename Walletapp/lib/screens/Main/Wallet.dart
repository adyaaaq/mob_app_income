import 'package:flutter/material.dart';
import 'package:walletapp/components/Tabs.dart';
import 'package:walletapp/components/TransactionTile.dart';
import 'package:walletapp/screens/Expenses.dart';
import 'package:walletapp/screens/Main/HomePage.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    // Image background
                    image: DecorationImage(
                      image:
                          AssetImage('bg.png'), // Replace with your image path
                      fit: BoxFit
                          .cover, // Makes the image cover the entire container
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 64, left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {},
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
                            icon: Icon(Icons.notifications_none,
                                color: Colors.white),
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
                      const Center(
                        child: Column(
                          children: [
                            Text(
                              'Нийт үлдэгдэл',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '\$2,548.00',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Action Buttons
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ActionButton(
                              icon: Icons.add,
                              label: 'Нэмэх',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Expenses()),
                                );
                              },
                            ),
                            ActionButton(
                              icon: Icons.grid_view,
                              label: 'Төлөх',
                            ),
                            ActionButton(icon: Icons.send, label: 'Илгээх'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Transaction Tabs with Expanded
                      SizedBox(
                        height:
                            300, // Set a fixed height for the TransactionTabs
                        child: TransactionTabs(
                          titles: const [
                            'Гүйлгээнүүд',
                            'Хүлээгдэж буй гүйлгээ'
                          ],
                          tabContents: const [
                            TransactionsList(),
                            PendingTransactions(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed; // Optional callback for custom action

  const ActionButton({
    required this.icon,
    required this.label,
    this.onPressed, // Allow null for default behavior
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () => print('ActionButton tapped'), // Default action
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.teal,
                width: 1, // Border with teal color
              ),
            ),
            child: Icon(icon, color: Colors.teal, size: 28),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

// Example Content for 'Гүйлгээнүүд' Tab
class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        TransactionTile(
          imagePath: 'assets/Frame9.png',
          title: 'Upwork',
          date: 'Өнөөдөр',
          amount: '+ \$850.00',
          amountColor: Colors.green,
          type: 1,
        ),
        TransactionTile(
          imagePath: 'assets/Group11.png',
          title: 'Шилжүүлэг',
          date: 'Өчигдөр',
          amount: '- \$85.00',
          amountColor: Colors.red,
          type: 1,
        ),
        TransactionTile(
          imagePath: 'assets/paypal.png',
          title: 'Paypal',
          date: 'Jan 30, 2022',
          amount: '+ \$1,406.00',
          amountColor: Colors.green,
          type: 1,
        ),
        TransactionTile(
          imagePath: 'assets/youtube.png',
          title: 'Youtube',
          date: 'Jan 16, 2022',
          amount: '- \$11.99',
          amountColor: Colors.red,
          type: 1,
        ),
      ],
    );
  }
}

// Example Content for 'Хүлээгдэж буй гүйлгээ' Tab
class PendingTransactions extends StatelessWidget {
  const PendingTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        TransactionTile(
          imagePath: 'assets/Frame9.png',
          title: 'Upwork',
          date: 'Өнөөдөр',
          amount: '+ \$850.00',
          amountColor: Colors.green,
          type: 2,
        ),
        TransactionTile(
          imagePath: 'assets/Group11.png',
          title: 'Шилжүүлэг',
          date: 'Өчигдөр',
          amount: '- \$85.00',
          amountColor: Colors.red,
          type: 2,
        ),
        TransactionTile(
          imagePath: 'assets/paypal.png',
          title: 'Paypal',
          date: 'Jan 30, 2022',
          amount: '+ \$1,406.00',
          amountColor: Colors.green,
          type: 2,
        ),
        TransactionTile(
          imagePath: 'assets/youtube.png',
          title: 'Youtube',
          date: 'Jan 16, 2022',
          amount: '- \$11.99',
          amountColor: Colors.red,
          type: 2,
        ),
      ],
    );
  }
}
