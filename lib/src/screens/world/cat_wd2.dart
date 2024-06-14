import 'package:flutter/material.dart';
import 'package:nyan_cat_war/src/screens/world/cat_wd.dart';
import 'package:nyan_cat_war/src/screens/world/cat_wd3.dart';

class WorldPage2 extends StatefulWidget {
  const WorldPage2({super.key});

  @override
  State<WorldPage2> createState() => _WorldPage2State();
}

class _WorldPage2State extends State<WorldPage2> {
  final List<String> world = [
    "日本","韓国","中国","モンゴル","ロシア","ノルウェー","イギリス","デンマーク",
    "ドイツ","フランス","スペイン","モナコ","イタリア","ギリシャ","トルコ","ドバイ",
    "インド","ネパール","タイ","カンボジア","フィリピン","シンガポール","オーストラリア",
    "深淵の大渦","マダガスカル","ケニア","サウジアラビア","エジプト","サハラ","ガーナ","南アフリカ",
    "アルゼンチン","イースター島","マチュピチュ","コロンビア","ジャマイカ","メキシコ","ハリウッド",
    "ラスベガス","アラスカ","カナダ","グリーンランド","ニューヨーク","NASA","バミューダ","ブラジル",
    "浮遊大陸","月",
  ];

  final Map<String, List<String>> prefectureImages = {
    "日本": ["000", "001", "002", "167"],
    "韓国": ["000", "001", "002", "003", "167"],
    "中国": ["001", "002", "004", "005", "006", "014"],
    "モンゴル": ["003", "007", "013", "015", "167"],
    "ロシア": ["000", "002", "005", "008", "014", "015"],
    "ノルウェー": ["002", "003", "169"],
    "イギリス": ["001", "005", "013", "167", "170"],
    "デンマーク": ["002", "008", "011", "014", "015"],
    "ドイツ": ["000", "002", "004", "022", "168"],
    "フランス": ["003", "005", "006", "169"],
    "スペイン": ["000", "001", "002", "007", "010", "167", "182"],
    "モナコ": ["000", "001", "002", "005", "008", "167", "173"],
    "イタリア": ["000", "001", "009", "011", "014", "015"],
    "ギリシャ": ["002", "007", "012", "013", "047", "167", "175"],
    "トルコ": ["000", "002", "003", "005", "010", "167", "173"],
    "ドバイ": ["004", "006", "014", "022", "167", "170", "183"],
    "インド": ["000", "002", "009", "014", "015"],
    "ネパール": ["000", "001", "006", "013", "022", "169"],
    "タイ": ["012", "046", "167", "184"],
    "カンボジア": ["002", "003", "010", "013", "014", "015", "169", "171"],
    "フィリピン": ["001", "002", "008", "009", "167", "170"],
    "シンガポール": ["000", "001", "002", "004", "014", "015", "017"],
    "オーストラリア": ["000", "001", "010", "013", "171", "182"],
    "深淵の大渦": ["005", "013", "167", "168", "180", "183", "184"],
    "マダガスカル": ["046", "047", "114", "167", "169"],
    "ケニア": ["001", "004", "006", "008", "013", "051"],
    "サウジアラビア": ["000", "007", "011", "012", "014", "015", "167", "170"],
    "エジプト": ["000", "001", "002", "022", "046", "171"],
    "サハラ": ["001", "002", "004", "167", "169", "175"],
    "ガーナ": ["003", "008", "113", "118", "169", "170"],
    "南アフリカ": ["004", "011", "014", "167", "175", "183"],
    "アルゼンチン": ["000", "001", "010", "013", "046", "052", "167"],
    "イースター島": ["002", "005", "015", "017", "018", "146"],
    "マチュピチュ": ["005", "006", "013", "022", "168", "171"],
    "コロンビア": ["046", "047", "051", "113", "114", "124"],
    "ジャマイカ": ["000", "001", "005", "168", "170", "173"],
    "メキシコ": ["002", "011", "017", "038", "118", "146", "167"],
    "ハリウッド": ["001", "002", "167", "168", "172"],
    "ラスベガス": ["000", "001", "006", "013", "022", "052"],
    "アラスカ": ["005", "015", "114", "115", "167", "170"],
    "カナダ": ["002", "003", "006", "167", "171", "172"],
    "グリーンランド": ["012", "046", "175"],
    "ニューヨーク": ["000", "001", "002", "014", "015", "167", "178"],
    "NASA": ["046", "124", "167", "174", "182", "184"],
    "バミューダ": ["000", "003", "005", "013", "169", "173", "175"],
    "ブラジル": ["001", "002", "004", "118", "167", "172", "183"],
    "浮遊大陸": ["002", "007", "113", "114", "168", "170", "171", "177", "183"],
    "月": ["167", "168", "170", "172", "175", "178", "181", "182", "184"],
  };

  final PageController _pageController = PageController(viewportFraction: 0.8);


  _showChapterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ここから章を変更できます！'),
          content: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WorldPage()),
                  );
                },
                child: const Text('第一章'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WorldPage2()),
                  );
                },
                child: const Text('第二章'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WorldPage3()),
                  );
                },
                child: const Text('第三章'),
              ),
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
            const Text('未来編第2章'),
            const SizedBox(width: 8.0),  // テキストと画像の間にスペースを追加
            Flexible(child: Image.network('https://i.pinimg.com/originals/fa/f1/c9/faf1c9c66bf0bd67a87f0a181ea21122.png', height: 50.0, width: 50.0)),
          ],
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: world.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    world[index],
                    style: const TextStyle(fontSize: 24.0),
                  ),
                  const SizedBox(height: 20),
                  if (prefectureImages.containsKey(world[index]))
                    ...prefectureImages[world[index]]!
                        .map((imageName) => Image.network("https://b-cats.info/storage/enemy_icon/enemy_icon_$imageName.png"))
                        .toList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}