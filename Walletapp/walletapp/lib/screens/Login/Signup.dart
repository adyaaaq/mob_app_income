import 'package:flutter/material.dart';
import 'Login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                  height: 145,
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

              // First Text
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

              // Second Text
              Positioned(
                top: 179,
                left: 50,
                right: 50,
                child: const Text(
                  'Орлого, зарлагаа хянахад тань туслана',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Name Input Box
              Positioned(
                top: 280,
                left: 30,
                right: 30,
                child: SizedBox(
                  width: 328.51,
                  height: 53.96,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Бүтэн нэрээ оруулна уу? ',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      filled: true,
                      fillColor: Colors.grey[100], // Background color for input
                    ),
                  ),
                ),
              ),

              // Email Input Box
              Positioned(
                top: 360,
                left: 30,
                right: 30,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Имэйлээ оруулна уу?',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),

              // Password Input Box
              Positioned(
                top: 440,
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

              // Re-enter Password Input Box
              Positioned(
                top: 520,
                left: 30,
                right: 30,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Нууц үгээ давтан оруулаарай',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),

              // Register Button
              Positioned(
                top: 630,
                left: 30,
                child: SizedBox(
                  width: 342,
                  height: 74,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your onPressed logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF69AEA9), // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(40), // Rounded corners
                      ),
                    ),
                    child: const Text(
                      'Бүртгүүлэх',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white, // Button text color
                      ),
                    ),
                  ),
                ),
              ),

              // "Are you a new customer?" and "Login" Texts
              Positioned(
                bottom: 20, // Position near the bottom
                left: 80, // Adjust to align properly
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Хэрэглэгчийн эрхтэй юу? ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54, // Text color
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the login page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()),
                        );
                      },
                      child: const Text(
                        'Нэвтрэх',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue, // Text color for login
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
