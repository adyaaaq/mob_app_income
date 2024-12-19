import 'package:flutter/material.dart';
import 'package:walletapp/components/TransactionTile.dart';
import 'package:walletapp/service/user_session.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transactions = UserSession().transactions ?? [];

    // Filter transactions where 'isdone' == 1
    final filteredTransactions = transactions
        .where((transaction) =>
            int.tryParse(transaction['isdone'].toString()) == 1)
        .toList();

    String _formatAmount(String amount) {
      // Attempt to parse the string to a double
      final parsedAmount = double.tryParse(amount) ?? 0.0;

      return parsedAmount >= 0
          ? '+ \$${parsedAmount.toStringAsFixed(2)}'
          : '- \$${parsedAmount.abs().toStringAsFixed(2)}';
    }

    // Helper method to format the date string (you can adjust this based on your date format)
    String _formatDate(String date) {
      DateTime parsedDate = DateTime.parse(date);
      return '${parsedDate.year}-${parsedDate.month}-${parsedDate.day}';
    }

    final userName =
        (UserSession().isLoggedIn && UserSession().userData != null)
            ? UserSession().userData!['name'] ?? 'Guest'
            : 'Guest';

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  // Image background
                  image: DecorationImage(
                    image: AssetImage('bg.png'), // Replace with your image path
                    fit: BoxFit
                        .cover, // Makes the image cover the entire container
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 64, left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Өглөөний мэнд?',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            userName,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
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
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.13,
                ),
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF2F7E79),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(0.4), // Shadow color with opacity
                        offset: const Offset(
                            0, 16), // Horizontal and vertical offset
                        blurRadius: 12, // Blur radius
                        spreadRadius: 2, // Spread radius
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Нийт үлдэгдэл',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '\$2,548.00',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BalanceInfo(
                              label: 'Орлого',
                              amount: '\$1,840.00',
                            ),
                            BalanceInfo(
                              label: 'Зарлага',
                              amount: '\$284.00',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height *
                      0.32, // 15% of screen height for top padding
                  left: 16.0, // 16px for left padding
                  right: 16.0, // 16px for right padding
                  bottom: 16.0, // 16px for bottom padding
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Section

                    // Balance Card with Rounded Background

                    const SizedBox(height: 30),

                    // Transaction History
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Гүйлгээний Түүх',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Бүгдийг харах',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ...filteredTransactions.map((transaction) =>
                        TransactionTile(
                          id: transaction['id'].toString(),
                          imagePath: transaction['imgUrl'].toString(),
                          title: transaction['name'].toString(),
                          date: _formatDate(transaction['date'].toString()),
                          amount:
                              _formatAmount(transaction['amount'].toString()),
                          amountColor: double.tryParse(
                                          transaction['amount'].toString()) !=
                                      null &&
                                  double.tryParse(
                                          transaction['amount'].toString())! >=
                                      0
                              ? Colors.green
                              : Colors.red,
                          type:
                              int.tryParse(transaction['isdone'].toString()) ??
                                  0,
                        )),

                    SizedBox(height: 20),

                    // Send Again Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Send Again',
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'See all',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection:
                          Axis.horizontal, // Enables horizontal scrolling
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          // CircleAvatars with images
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                                'assets/youtube.png'), // Replace with your image path
                          ),
                          SizedBox(width: 16), // Spacing between avatars

                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                                'assets/youtube.png'), // Replace with your image path
                          ),
                          SizedBox(width: 16),

                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                                'assets/youtube.png'), // Replace with your image path
                          ),
                          SizedBox(width: 16),

                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                                'assets/youtube.png'), // Replace with your image path
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                                'assets/youtube.png'), // Replace with your image path
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                                'assets/youtube.png'), // Replace with your image path
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                                'assets/youtube.png'), // Replace with your image path
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                                'assets/youtube.png'), // Replace with your image path
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                                'assets/youtube.png'), // Replace with your image path
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Balance Information Widget
class BalanceInfo extends StatelessWidget {
  final String label;
  final String amount;

  const BalanceInfo({required this.label, required this.amount, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(
          amount,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
