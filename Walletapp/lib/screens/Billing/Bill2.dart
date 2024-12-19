import 'package:flutter/material.dart';
import 'package:walletapp/components/PaymentSelection.dart';
import 'package:walletapp/screens/Billing/Bill3.dart';
import 'package:walletapp/service/api.dart';

class Bill2 extends StatelessWidget {
  final String id;
  final String title;
  final String date;
  final String amount;
  final String imagePath;
  final String billtype;

  const Bill2({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
    required this.imagePath,
    required this.billtype,
    super.key,
  });

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
                    Center(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                              imagePath,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Text(
                            "You will pay Youtube Premium for one month with BCA OneKlik",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
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
                              '\$ ${amount}',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
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
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
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
                              '\$ ${amount}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                    const SizedBox(height: 24),
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
                      onPressed: () async {
                        // Call the updateTransaction function
                        final response =
                            await Api.updateTransaction(int.parse(id));

                        if (response['success']) {
                          // Navigate to Bill3 if the update was successful
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Bill3(
                                id: id,
                                billtype: billtype,
                                amount: amount,
                                title: title,
                                date: date,
                                imagePath: imagePath,
                              ),
                            ),
                          );
                        } else {
                          // Show an error message if the update failed
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(response['message']),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
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
                        'Баталгаажуулах',
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
