import 'package:flutter/material.dart';
import 'package:walletapp/Home.dart';
import 'package:walletapp/screens/Login/Login.dart';
import 'dart:math'; // For degree-to-radian conversion
import 'Signup.dart'; // Import the Register page

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 420,
          height: 890,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16), // Rounded corners
          ),
          child: Stack(
            children: [
              // Background Image (Man raising hand)
              Positioned(
                top: 100.91, // Adjust the position
                left: 51.03,
                child: Image.asset(
                  'Group1.png',
                  width: 300, // Adjust as needed
                  height: 500, // Adjust as needed
                ),
              ),

              Positioned(
                top: 180.0, // Adjust based on the hand's position
                left: 100.0, // Adjust based on the hand's position
                child: Transform.rotate(
                  angle: -7.38 * (pi / 180), // Rotate -27.38 degrees
                  child: Image.asset(
                    'Coint.png',
                    width: 70.9, // Adjust size
                    height: 70.9, // Adjust size
                  ),
                ),
              ),

              // Donut Image positioned on the hand
              Positioned(
                top: 220.0, // Adjust to position on the hand
                left: 250.0, // Adjust to position on the hand
                child: Image.asset(
                  'Donut.png',
                  width: 70.9, // Adjust size
                  height: 70.9, // Adjust size
                ),
              ),

              // Text
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 180), // Adjust spacing
                  child: const Text(
                    'Ухаалаг зарцуулж\n илүү хэмнэе.',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF438883), // Corrected color code
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              // Login Button
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: SizedBox(
                    width: 200, // Button width
                    height: 50, // Button height
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF69AEA9), // Button color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(40), // Rounded corners
                        ),
                      ),
                      child: const Text(
                        'Эхлэх',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white, // Button text color
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // "Are you a new customer?" and "Log in" texts
              Positioned(
                bottom: 40, // Adjust spacing from the bottom
                left: 50,
                right: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigate to the Register page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Register(),
                          ),
                        );
                      },
                      child: const Text(
                        'Танд хэрэглэгчийн эрх бий юу?',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5), // Space between the texts
                    GestureDetector(
                      onTap: () {
                        // Add your log-in navigation logic here
                      },
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF69AEA9), // Link color
                          fontWeight: FontWeight.bold,
                        ),
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
