import 'package:flutter/material.dart';

class splash extends StatelessWidget {
  const splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // callDelay(context);
    return Container(
      width: 420,
      height: 890,
      color: const Color(0xFF69AEA9), // Setting background color to #69AEA9
      child: Center(
        child: Container(
          child: const Text(
            "Сайн Байна уу?",
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  // Future callDelay(BuildContext context) async {
  //   await Future.delayed(const Duration(milliseconds: 4000), () {});
  //   Navigator.pushNamed(context, "/OnBoarding");
  // }
}
