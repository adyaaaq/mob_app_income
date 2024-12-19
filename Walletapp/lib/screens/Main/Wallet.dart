import 'package:flutter/material.dart';
import 'package:walletapp/components/Tabs.dart';
import 'package:walletapp/components/TransactionTile.dart';
import 'package:walletapp/screens/Expenses.dart';
import 'package:walletapp/screens/Main/HomePage.dart';
import 'package:walletapp/service/user_session.dart';

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

class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = UserSession().transactions ?? [];

    // Filter transactions where 'isdone' == 1
    final filteredTransactions = transactions
        .where((transaction) =>
            int.tryParse(transaction['isdone'].toString()) == 1)
        .toList();

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        ...filteredTransactions.map((transaction) => TransactionTile(
              id: transaction['id'].toString(),
              imagePath: transaction['imgUrl'].toString(),
              title: transaction['name'].toString(),
              date: _formatDate(transaction['date'].toString()),
              amount: _formatAmount(transaction['amount'].toString()),
              amountColor: double.tryParse(transaction['amount'].toString()) !=
                          null &&
                      double.tryParse(transaction['amount'].toString())! >= 0
                  ? Colors.green
                  : Colors.red,
              type: int.tryParse(transaction['isdone'].toString()) ?? 0,
            )),
      ],
    );
  }

  // Helper method to format the date string
  String _formatDate(String date) {
    DateTime parsedDate = DateTime.tryParse(date) ?? DateTime.now();
    return '${parsedDate.year}-${parsedDate.month.toString().padLeft(2, '0')}-${parsedDate.day.toString().padLeft(2, '0')}';
  }

  // Helper method to format the amount with a plus or minus sign
  String _formatAmount(String amount) {
    final parsedAmount = double.tryParse(amount) ?? 0.0;
    return parsedAmount >= 0
        ? '+ \$${parsedAmount.toStringAsFixed(2)}'
        : '- \$${parsedAmount.abs().toStringAsFixed(2)}';
  }
}

// Example Content for 'Хүлээгдэж буй гүйлгээ' Tab
class PendingTransactions extends StatelessWidget {
  const PendingTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = UserSession().transactions ?? [];

    // Filter transactions where 'isdone' == 1
    final filteredTransactions = transactions
        .where((transaction) =>
            int.tryParse(transaction['isdone'].toString()) == 0)
        .toList();

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        ...filteredTransactions.map((transaction) => TransactionTile(
              id: transaction['id'].toString(),
              imagePath: transaction['imgUrl'].toString(),
              title: transaction['name'].toString(),
              date: _formatDate(transaction['date'].toString()),
              amount: _formatAmount(transaction['amount'].toString()),
              amountColor: double.tryParse(transaction['amount'].toString()) !=
                          null &&
                      double.tryParse(transaction['amount'].toString())! >= 0
                  ? Colors.green
                  : Colors.red,
              type: int.tryParse(transaction['isdone'].toString()) ?? 0,
            )),
      ],
    );
  }

  // Helper method to format the date string
  String _formatDate(String date) {
    DateTime parsedDate = DateTime.tryParse(date) ?? DateTime.now();
    return '${parsedDate.year}-${parsedDate.month.toString().padLeft(2, '0')}-${parsedDate.day.toString().padLeft(2, '0')}';
  }

  // Helper method to format the amount with a plus or minus sign
  String _formatAmount(String amount) {
    final parsedAmount = double.tryParse(amount) ?? 0.0;
    return parsedAmount >= 0
        ? '+ \$${parsedAmount.toStringAsFixed(2)}'
        : '- \$${parsedAmount.abs().toStringAsFixed(2)}';
  }
}
