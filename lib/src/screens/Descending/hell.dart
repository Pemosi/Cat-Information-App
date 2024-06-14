import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:nyan_cat_war/src/screens/bgm_controller.dart';
import 'package:provider/provider.dart';

class HellPage extends StatefulWidget {
  const HellPage({super.key});

  @override
  State<HellPage> createState() => _HellPageState();
}

class _HellPageState extends State<HellPage> {
  
  final Map<String, List<String>> prefectureImages = {
    "修羅の道 極ムズ": ["008", "032", "038", "118", "267"]
  };

  final PageController _pageController = PageController(viewportFraction: 0.8);

  final AudioPlayer _bgmPlayer = AudioPlayer();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (Provider.of<BGMController>(context).isBGMPlaying) {
      _bgmPlayer.play(AssetSource('bgm/降臨.mp3'));
      _bgmPlayer.setReleaseMode(ReleaseMode.loop);
    } else {
      _bgmPlayer.stop();
    }
  }

  @override
  void dispose() {
    _bgmPlayer.stop();
    _bgmPlayer.dispose();
    super.dispose(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('地獄門'),
            const SizedBox(width: 8.0),  // テキストと画像の間にスペースを追加
            Flexible(child: Image.network('https://i.pinimg.com/originals/fa/f1/c9/faf1c9c66bf0bd67a87f0a181ea21122.png', height: 50.0, width: 50.0)),
          ],
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: prefectureImages.length,
        itemBuilder: (context, index) {
          final prefectures = prefectureImages.keys.toList();
          final prefectureName = prefectures[index];
          final areaImages = prefectureImages[prefectureName]!;
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    prefectureName,
                    style: const TextStyle(fontSize: 24.0),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: areaImages.map((imageName) {
                      if (imageName.startsWith("https")) {
                        return Image.network(imageName, width: 70, height: 70,);
                      } else {
                        return Image.network("https://b-cats.info/storage/enemy_icon/enemy_icon_$imageName.png");
                      }
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}