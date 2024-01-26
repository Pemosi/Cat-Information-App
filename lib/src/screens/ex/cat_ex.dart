import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:nyan_cat_war/src/screens/ex/cat_ex2.dart';
import 'package:nyan_cat_war/src/screens/ex/cat_ex3.dart';

class SpaceSpecialStage extends StatefulWidget {
  const SpaceSpecialStage({super.key});

  @override
  State<SpaceSpecialStage> createState() => _SpaceSpecialStageState();
}

class _SpaceSpecialStageState extends State<SpaceSpecialStage> {
  final AudioPlayer _bgmPlayer = AudioPlayer();

  bool isMuted = false;

  final List<String> imageUrls = [
    'https://img.game8.jp/3896163/4419891967e03e46d6247e9989e26b76.jpeg/show',
    'https://img.game8.jp/3964885/326dd077a548363fe171e01aacc32e42.png/show',
    'https://img.game8.jp/3671797/c9be55c75522523ffdc741c6de5a1e1c.png/show',
    'https://img.game8.jp/3656668/49e0d18b4ce748317be59f3c39e8a64e.png/show',
    'https://img.game8.jp/3964851/fff58ed5272461b8aeef52050b4f1f90.png/show',
    'https://img.game8.jp/3964853/c3df1b4a8f908bfb9e0c622587162a12.png/show'
  ];

  @override
  void initState() {
    super.initState();
    _bgmPlayer.play(AssetSource('スターフィリバスター.mp3'));
    _bgmPlayer.setReleaseMode(ReleaseMode.loop);
  }

  @override
  void dispose() {
    _bgmPlayer.stop();
    _bgmPlayer.dispose();
    super.dispose();
  }

  void onRepeatIconPressed() {
    setState(() {
      isMuted = !isMuted;
      isMuted ? _bgmPlayer.pause() : _bgmPlayer.resume();
    });
  }

  IconButton muteButton() {
    return IconButton(
      icon: isMuted ? const Icon(Icons.volume_off) : const Icon(Icons.volume_up),
      onPressed: onRepeatIconPressed,
    );
  }

  _showChapterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ここで章を変更できます！'),
          content: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SpaceSpecialStage()),
                  );
                },
                child: const Text('宇宙編EXステージ'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SpaceSpecialStage2()),
                  );
                },
                child: const Text('魔界編EXステージ'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SpaceSpecialStage3()),
                  );
                },
                child: const Text('レジェンドEXステージ'),
              ),
              const SizedBox(height: 20),
              const Text(
                '以下のボタンでBGMを一時停止できます。もう一度押すと再開します。',
                style: TextStyle(fontSize: 18),
              ),
              muteButton(),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            onPressed: () => _showChapterDialog(),
            icon: const Icon(Icons.menu),
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('宇宙編EXステージ'),
            const SizedBox(width: 8.0),
            Image.network(
              'https://i.pinimg.com/originals/fa/f1/c9/faf1c9c66bf0bd67a87f0a181ea21122.png',
              height: 50.0,
              width: 50.0,
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/宇宙.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '宇宙の危機！スターフィリバスター',
                style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              for (String imageUrl in imageUrls)
                Image.network(
                  imageUrl,
                  height: 50,
                  width: 50,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
