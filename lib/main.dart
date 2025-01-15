import 'package:flutter/material.dart';
import 'screens/HomeScreen.dart';

void main() {
  runApp(const Shahayak());
}

class Shahayak extends StatelessWidget {
  const Shahayak({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Homescreen(),
    );
  }
}
