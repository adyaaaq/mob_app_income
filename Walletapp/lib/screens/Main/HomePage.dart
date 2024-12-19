import 'package:flutter/material.dart';
import 'package:walletapp/components/TransactionTile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                            'Н.Даваа',
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
