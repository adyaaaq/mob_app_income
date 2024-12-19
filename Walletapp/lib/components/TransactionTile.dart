import 'package:flutter/material.dart';
import 'package:walletapp/screens/Billing/Bill1.dart';

class TransactionTile extends StatelessWidget {
  final String id; // Path to the image for the logo
  final String imagePath; // Path to the image for the logo
  final String title;
  final String date;
  final String amount;
  final Color amountColor;
  final int type; // Type parameter to determine what to display

  const TransactionTile({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.date,
    required this.amount,
    required this.amountColor,
    required this.type, // Added type parameter
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: 4), // Optional spacing between items
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo with image
          Image.asset(
            imagePath,
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 12),

          // Title and Date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  date,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),

          // Conditional display based on type
          if (type == 1)
            Text(
              amount,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: amountColor,
              ),
            )
          else
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Bill1(
                          id: id,
                          title: title,
                          date: date,
                          amount: amount,
                          imagePath: imagePath),
                    ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Төлөх'),
            ),
        ],
      ),
    );
  }
}
