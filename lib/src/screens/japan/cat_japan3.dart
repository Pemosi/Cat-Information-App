import 'package:flutter/material.dart';

class JapanPage3 extends StatefulWidget {
  const JapanPage3({super.key});

  @override
  State<JapanPage3> createState() => _JapanPage3State();
}

class _JapanPage3State extends State<JapanPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('日本編第３章'),
        backgroundColor: Colors.amber,
      )
    );
  }
}