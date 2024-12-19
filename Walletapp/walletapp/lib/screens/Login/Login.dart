// Login.dart
import 'package:flutter/material.dart';
import 'package:walletapp/screens/Login/Signup.dart';
import 'package:walletapp/Home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 420, // Set the desired width
          height: 896, // Set the desired height
          decoration: BoxDecoration(
            color: Colors.white, // Background color
            borderRadius: BorderRadius.circular(16), // Rounded corners
          ),
          child: Stack(
            children: [
              // Rectangle28.png (Background)
              Positioned(
                top: -13,
                left: 0,
                child: Image.asset(
                  'assets/Rectangle28.png',
                  width: 414, // Adjust size
                  height: 257,
                  fit: BoxFit.cover,
                ),
              ),

              // Ellipse1.png (Overlay on Rectangle28.png)
              Positioned(
                top: 8,
                left: -48,
                child: Image.asset(
                  'assets/Ellipse1.png',
                  width: 155, // Adjust size
                  height: 144,
                ),
              ),

              // Ellipse2.png (Overlay on Rectangle28.png)
              Positioned(
                top: -43,
                left: -2,
                child: Image.asset(
                  'assets/Ellipse2.png',
                  width: 158, // Adjust size
                  height: 147,
                ),
              ),
              Positioned(
                top: 127,
                left: 100,
                right: 100,
                child: const Text(
                  'Тавтай морилно уу?',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Second Text (Image)
              Positioned(
                top: 245,
                left: 50,
                right: 50,
                child: Image.asset(
                  'assets/4pics.png',
                  width: 266, // Adjust size
                  height: 178,
                ),
              ),

              // Name Input Box
              Positioned(
                top: 456.79,
                left: 30,
                right: 30,
                child: SizedBox(
                  width: 328.51,
                  height: 53.96,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Имэйл хаягаа оруулна уу? ',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      filled: true,
                      fillColor: Colors.grey[100], // Background color for input
                    ),
                  ),
                ),
              ),

              // Password Input Box
              Positioned(
                top: 533.79,
                left: 30,
                right: 30,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Нууц үгээ оруулаарай',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
              // Log In Button (Navigate to Wallet page)
              Positioned(
                top: 630,
                left: 30,
                child: SizedBox(
                  width: 342,
                  height: 74,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to Wallet page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF69AEA9), // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(40), // Rounded corners
                      ),
                    ),
                    child: const Text(
                      'Нэвтрэх',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white, // Button text color
                      ),
                    ),
                  ),
                ),
              ),

              // "Are you a new customer?" and "Register" Texts
              Positioned(
                bottom: 20, // Position near the bottom
                left: 80, // Adjust to align properly
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Хэрэглэгчийн эрхтэй юу?.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54, // Text color
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the Register page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const Register()), // Navigate to Register
                        );
                      },
                      child: const Text(
                        'Бүртгүүлэх',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue, // Text color for Register
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
