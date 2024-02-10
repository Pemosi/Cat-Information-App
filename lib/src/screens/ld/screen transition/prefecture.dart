import 'package:flutter/material.dart';

class PrefecturePage extends StatelessWidget {
  final List<String> images;

  const PrefecturePage({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prefecture Page'),
      ),
      body: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Center(
            child: Image.network(images[index]),
          );
        },
      ),
    );
  }
}