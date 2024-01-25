import 'package:flutter/material.dart';

class LegendPage extends StatefulWidget {
  const LegendPage({super.key});

  @override
  State<LegendPage> createState() => _LegendPageState();
}

class _LegendPageState extends State<LegendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('レジェンドストーリー'),
      ),
    );
  }
}