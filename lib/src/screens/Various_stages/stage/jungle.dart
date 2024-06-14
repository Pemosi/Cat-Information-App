import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:nyan_cat_war/src/screens/bgm_controller.dart';
import 'package:provider/provider.dart';

class GhapraJunglePage extends StatefulWidget {
  const GhapraJunglePage({super.key});

  @override
  State<GhapraJunglePage> createState() => _GhapraJunglePageState();
}

class _GhapraJunglePageState extends State<GhapraJunglePage> {

  final Map<String, List<String>> prefectureImages = {
    "多湿樹海 エリア1": ["001", "013", "015", "022", "603"],
    "多湿樹海 エリア2": ["003", "009", "010", "015", "603"],
    "多湿樹海 エリア3": ["005", "012", "047", "603"],
    "多湿樹海 エリア4": ["014", "113", "115", "603", "604"],
    "大熱森林 エリア5": ["004", "014", "118", "603", "610"],
    "大熱森林 エリア6": ["008", "014", "038", "048", "118", "603", "604"],
    "大熱森林 エリア7": ["011", "603", "607", "610"],
    "大熱森林 エリア8": ["001", "006", "010", "013", "015", "603", "604"],
    "大熱森林 エリア9": ["014", "552", "603", "604", "610"],
    "大熱森林 エリア10": ["046", "549", "603", "610"],
    "豪雨樹林 エリア11": ["118", "036", "604", "https://img.game8.jp/6142496/01c3eec149d80667bfb8fcf36a7d7928.jpeg/show", "610", "554"],
    "豪雨樹林エリア12": ["552", "168", "364", "603", "171", "554", "610", "https://img.game8.jp/7717030/258fad500e70d45d5e77c17817b08dfe.jpeg/show", "https://img.game8.jp/7505152/0bd30f312155091c1b30d27944d6e188.jpeg/show"],
    "豪雨樹林エリア13": ["603", "015", "046", "051", "549", "256", "https://img.game8.jp/7717030/258fad500e70d45d5e77c17817b08dfe.jpeg/show", "178", "123"],
    "豪雨樹林エリア14": ["603", "022", "498", "013", "124", "611"],
    "豪雨樹林エリア15": ["554", "114", "113", "160", "https://img.game8.jp/7717030/258fad500e70d45d5e77c17817b08dfe.jpeg/show"],
    "豪雨樹林エリア16": ["603", "614", "146", "https://img.game8.jp/7990822/a5889ee3356e7aa3fb2293fecbab2f72.jpeg/show", "610", "043"],
    "絶境原生林エリア17": ["254", "051", "604", "https://img.game8.jp/8332662/1386d145d8c43b219cbe510b0373f989.jpeg/show", "023", "611", "379"],
    "絶境原生林エリア18": ["147", "000", "610", "549", "https://img.game8.jp/7990822/a5889ee3356e7aa3fb2293fecbab2f72.jpeg/show", "604"],
    "絶境原生林エリア19": ["292", "167", "603", "https://img.game8.jp/7990822/a5889ee3356e7aa3fb2293fecbab2f72.jpeg/show", "289", "https://img.game8.jp/7239794/cfce6ea34761952cbc51d28123fad6d9.png/show", "182", "614", "https://img.game8.jp/8332662/1386d145d8c43b219cbe510b0373f989.jpeg/show"],
    "禍嵐凶林エリアFINAL": ["015", "552", "https://img.game8.jp/7945820/1064063117844cd89c91509ded69e858.jpeg/show", "https://img.game8.jp/8824666/9e3351c25300a70dcbe2cab5bfb0588a.jpeg/show", "412", "556", "612"]
  };

  final PageController _pageController = PageController(viewportFraction: 0.8);

  final AudioPlayer _bgmPlayer = AudioPlayer();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (Provider.of<BGMController>(context).isBGMPlaying) {
      _bgmPlayer.play(AssetSource('bgm/密林の異変.mp3'));
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
            const Text('ガープラ密林'),
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