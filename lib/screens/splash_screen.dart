import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

  
    return Scaffold(
      body: Center(
        child: SizedBox(
  width: 250.0,
  child: DefaultTextStyle(
    style: const TextStyle(
      fontSize: 30.0,
      color: Colors.black,
     // fontFamily: 'Agne',
    ),
    child: AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText('ToDoList App',
          speed: const Duration(milliseconds: 100),
          cursor: '|',
          textStyle: const TextStyle(
            fontSize: 30.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
       
      ],
      onTap: () {
        print("Tap Event");
      },
    ),
  ),
),
      ),
    );
  }
}
