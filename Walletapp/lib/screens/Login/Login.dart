// Login.dart
import 'package:flutter/material.dart';
import 'package:walletapp/screens/Login/Signup.dart';
import 'package:walletapp/Home.dart';
import 'package:walletapp/service/api.dart'; // Import the Api class

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  // Function to handle login
  void _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    final response = await Api.login(email, password);

    setState(() {
      _isLoading = false;
    });

    if (response['success'] == true) {
      print('User Data: ${response['user']}');
      print('Transactions: ${response['transactions']}');

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Нууц үг эсвэл и-мэйл буруу байна.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 420,
          height: 896,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
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

              // Email Input
              Positioned(
                top: 400,
                left: 30,
                right: 30,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Имэйл хаягаа оруулна уу?',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Имэйл хаягаа оруулна уу';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // Password Input
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Нууц үгээ оруулаарай',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Нууц үгээ оруулаарай';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),

                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _handleLogin,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF69AEA9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          child: _isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white)
                              : const Text(
                                  'Нэвтрэх',
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
