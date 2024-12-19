import 'package:flutter/material.dart';
import 'package:walletapp/components/PaymentSelection.dart';
import 'package:walletapp/screens/Billing/Bill2.dart';

class Bill1 extends StatefulWidget {
  final String id;
  final String title;
  final String date;
  final String amount;
  final String imagePath;

  const Bill1({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
    required this.imagePath,
    super.key,
  });

  @override
  State<Bill1> createState() => _Bill1();
}

@override
class _Bill1 extends State<Bill1> {
  String _selectedPayment = 'Дебит карт';

  void _onPaymentSelected(String label) {
    setState(() {
      _selectedPayment = label;
    });
  }

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
              image: DecorationImage(
                image: AssetImage('assets/bg.png'),
                fit: BoxFit.cover,
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
                  const Text(
                    'Bill Details',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF408D87),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.more_horiz,
                          color: Colors.white), // Three-dot icon
                      onPressed: () {
                        // Define your action here
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: double.infinity,
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.20,
            ),
            padding: const EdgeInsets.only(
              left: 30.0,
              right: 30.0,
              top: 32.0,
              bottom: 16.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 4),
                  blurRadius: 12,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45),
                            color: Color(0xFFFAFAFA),
                          ),
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: Image.asset(
                              widget.imagePath,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.date,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Transaction Label
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Үнэ',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$ ${widget.amount}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Хураамж',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$ 0',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      height: 1, // The width of the line
                      width: double
                          .infinity, // Height of the line (e.g., match parent)
                      color: Color(0xFFDDDDDD), // Color of the line
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Нийт',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$ ${widget.amount}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Төлбөрийн хэрэгслээ сонго",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    PaymentSelection(
                      icon: Icons.credit_card,
                      label: 'Дебит карт',
                      isSelected: _selectedPayment == 'Дебит карт',
                      onTap: () => _onPaymentSelected('Дебит карт'),
                    ),
                    const SizedBox(height: 16),
                    PaymentSelection(
                      icon: Icons
                          .paypal, // Replace with actual PayPal icon if available
                      label: 'Paypal',
                      isSelected: _selectedPayment == 'Paypal',
                      onTap: () => _onPaymentSelected('Paypal'),
                    ),
                  ],
                ),
                // Row with Image and Text

                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF63A9A4),
                          Color(0xFF48908B),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.2), // Shadow color with opacity
                          blurRadius: 10, // How soft the shadow is
                          spreadRadius: 2, // How far the shadow spreads
                          offset: Offset(0, 4), // Position of the shadow
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Bill2(
                                    id: widget.id,
                                    billtype: _selectedPayment,
                                    amount: widget.amount,
                                    title: widget.amount,
                                    date: widget.date,
                                    imagePath: widget.imagePath,
                                  )),
                        )
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.transparent, // Transparent background
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(32), // Border radius
                        ),
                        elevation: 0, // No shadow
                      ),
                      child: const Text(
                        'Төлөх',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors
                              .white, // Ensure text color contrasts with gradient
                        ),
                      ),
                    ),
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

// Balance Information Widget
class Card extends StatelessWidget {
  final String label;
  final String amount;

  const Card({required this.label, required this.amount, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFFAFAFA),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: Color(0xFFFAFAFA),
            ),
            child: SizedBox(
              width: 24,
              height: 24,
              child: Image.asset(
                'assets/netflix.png', // Replace with your actual asset path
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
