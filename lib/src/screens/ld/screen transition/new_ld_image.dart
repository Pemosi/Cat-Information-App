import 'package:flutter/material.dart';

class NewLegendImagePage extends StatelessWidget {
  final String prefectureName;

  const NewLegendImagePage({super.key, required this.prefectureName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        // actions: [
        //   IconButton(
        //     onPressed: () => _showChapterDialog(),
        //     icon: const Icon(Icons.menu),
        //   ),
        // ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('旧レジェンドステージ'),
            const SizedBox(width: 8.0),  // テキストと画像の間にスペースを追加
            Image.network('https://i.pinimg.com/originals/fa/f1/c9/faf1c9c66bf0bd67a87f0a181ea21122.png', height: 50.0, width: 50.0),  // 画像のパスやサイズは適切に変更してください
          ],
        ),
      ),
      
    );
  }
}