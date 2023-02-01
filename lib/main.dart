import 'package:flutter/material.dart';

import 'homepage.dart';
import 'package:avatar_glow/avatar_glow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlashScreen(),
    );
  }
}

class FlashScreen extends StatefulWidget {
  const FlashScreen({super.key});

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'TIC TAC TOE GAME!',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          AvatarGlow(
            glowColor: Colors.white,
            endRadius: 200.0,
            duration: const Duration(milliseconds: 2000),
            repeat: true,
            showTwoGlows: true,
            repeatPauseDuration: const Duration(milliseconds: 100),
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                  border: Border.all(style: BorderStyle.none),
                  shape: BoxShape.circle),
              child: CircleAvatar(
                backgroundColor: Colors.grey[900],
                radius: 40.0,
                child: Image.asset(
                  'lib/images/Tic-tac-toe.png',
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MyHomePage()));
            },
            child: Container(
              width: 200,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.white),
              child: Center(
                child: Text(
                  'Play Now',
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade900),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
