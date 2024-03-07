import 'package:flutter/material.dart';
import 'package:nyan_cat_war/src/screens/Various_stages/stage/asibini_desert.dart';
import 'package:nyan_cat_war/src/screens/Various_stages/stage/gianforet_volcano.dart';
import 'package:nyan_cat_war/src/screens/Various_stages/stage/jungle.dart';

class SuperBeastPage extends StatefulWidget {
  const SuperBeastPage({super.key});

  @override
  State<SuperBeastPage> createState() => _SuperBeastPageState();
}

class _SuperBeastPageState extends State<SuperBeastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
            const Text('超獣ステージ'),
            const SizedBox(width: 8.0),  // テキストと画像の間にスペースを追加
            Image.network('https://b-cats.info/storage/enemy_icon/enemy_icon_603.png', width: 60, height: 60,),  // 画像のパスやサイズは適切に変更してください
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const GhapraJunglePage())//ガープラ密林
                  );
                },
                child: Image.asset(
                  'assets/stage_images/超獣ステージ/ghapra.png',
                  width: 400,
                  height: 400,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const AsibiniDesertPage())//アシビニ砂漠
                  );
                },
                child: Image.asset(
                  'assets/stage_images/超獣ステージ/asibini.png',
                  width: 400,
                  height: 400,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const GianforetVolcanoPage())//ジャンフォレ火山
                  );
                },
                child: Image.asset(
                  'assets/stage_images/超獣ステージ/gianfore.png',
                  width: 400,
                  height: 400,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}