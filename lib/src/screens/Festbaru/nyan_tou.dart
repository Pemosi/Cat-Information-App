import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:nyan_cat_war/src/screens/bgm_controller.dart';
import 'package:provider/provider.dart';

class TowerPage extends StatefulWidget {
  const TowerPage({super.key});

  @override
  State<TowerPage> createState() => _TowerPageState();
}

class _TowerPageState extends State<TowerPage> {
  final Map<String, List<String>> prefectureImages = { //画像の名前の部分の整数を階ごとに取得している
    "1階": ["000", "001", "002", "003"],
    "2階": ["000", "001", "002", "046"],
    "3階": ["004", "008", "014", "113"],
    "4階": ["000", "005", "006", "011", "012", "013", "015", "022"],
    "5階": ["005", "013", "167", "173"],
    "6階": ["000", "003", "004", "014", "015", "047", "048"],
    "7階": ["010", "013", "284", "285", "286", "289"],
    "8階": ["001", "002", "003", "006", "017"],
    "9階": ["002", "013", "015", "016", "031", "046"],
    "10階": ["000", "002", "015", "036", "066", "099", "156"],
    "11階": ["004", "014", "023", "063", "101", "111", "213"],
    "12階": ["024", "198", "199"],
    "13階": ["046", "048", "051", "052", "085", "087"],
    "14階": ["047", "054", "056", "147"],
    "15階": ["044", "108", "109", "110", "114", "115"],
    "16階": ["115", "116", "119", "125", "160"],
    "17階": ["167", "168", "171", "177", "182", "210", "211"],
    "18階": ["000", "001", "018", "102", "103", "104", "284", "285", "293"],
    "19階": ["017", "038", "050", "053", "114", "124", "125", "147", "174"],
    "20階": ["128", "129", "134", "138", "139"],
    "21階": ["002", "014", "017", "048", "064", "205", "213"],
    "22階": ["135", "207"],
    "23階": ["137", "167", "174", "208", "209"],
    "24階": ["046", "051", "052", "124", "131", "149", "256"],
    "25階": ["033", "034", "051", "123", "132", "178", "206", "254"],
    "26階": ["112", "113", "114", "115", "125", "254"],
    "27階": ["136", "199", "285", "287", "291", "293", "303"],
    "28階": ["047", "054", "056", "059", "140", "147"],
    "29階": ["008", "046", "051", "115", "127", "185", "207"],
    "30階": ["046", "118", "146", "354"],
    "31階": ["075", "079"],
    "32階": ["015", "040", "076"],
    "33階": ["077", "078", "080"],
    "34階": ["002", "045", "146", "179"],
    "35階": ["081", "146", "318"],
    "36階": ["046", "082", "288", "309"],
    "37階": ["023", "024", "046", "083", "148", "272"],
    "38階": ["071", "147", "284", "294"],
    "39階": ["210", "235", "256", "258"],
    "40階": ["114", "146", "254", "380"],
    "41階": ["181", "212", "246"],
    "42階": ["064", "069", "070", "112", "179", "294"],
    "43階": ["146", "291", "292", "316", "365", "388", "428"],
    "44階": ["046", "051", "232", "267"],
    "45階": ["002", "015", "036", "041", "271", "431"],
    "46階": ["017", "118", "257", "317"],
    "47階": ["037", "207", "256", "397", "479"],
    "48階": ["054", "147", "358", "359", "405"],
    "49階": ["010", "022", "354", "380"],
    "50階": ["146", "407", "412", "516"]
  };

  final PageController _pageController = PageController(viewportFraction: 0.8);

  final AudioPlayer _bgmPlayer = AudioPlayer();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (Provider.of<BGMController>(context).isBGMPlaying) {
      _bgmPlayer.play(AssetSource('にゃんこ塔50F.mp3'));
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
        actions: const [
          // IconButton(
          //   onPressed: () => _showChapterDialog(),
          //   icon: const Icon(Icons.menu),
          // ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('風雲にゃんこ塔'),
            const SizedBox(width: 8.0),  // テキストと画像の間にスペースを追加
            Image.network('https://i.pinimg.com/originals/fa/f1/c9/faf1c9c66bf0bd67a87f0a181ea21122.png', height: 50.0, width: 50.0),  // 画像のパスやサイズは適切に変更してください
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