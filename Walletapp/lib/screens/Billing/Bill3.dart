import 'package:flutter/material.dart';
import 'package:walletapp/components/PaymentSelection.dart';
import 'package:walletapp/components/TransactionDetails.dart';

class Bill3 extends StatelessWidget {
  const Bill3({Key? key}) : super(key: key);

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
                    'Bill Details3',
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
              bottom: 16,
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
                        Text(
                          "Амжилттай төлөгдлөө",
                          style: TextStyle(
                              color: Color(0xFF438883),
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Youtube Premium",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          height: 56,
                          width: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45),
                            color: Color(0xFFFAFAFA),
                          ),
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: Image.asset(
                              'accepted.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        TransactionDetails()
                      ],
                    )),
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
                      onPressed: () => print("clicked"),
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
                        'Share Receipt',
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
