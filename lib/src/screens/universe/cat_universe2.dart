import 'package:flutter/material.dart';
import 'package:nyan_cat_war/src/screens/universe/cat_universe.dart';
import 'package:nyan_cat_war/src/screens/universe/cat_universe3.dart';

class SpacePage2 extends StatefulWidget {
  const SpacePage2({super.key});

  @override
  State<SpacePage2> createState() => _SpacePage2State();
}

class _SpacePage2State extends State<SpacePage2> {

  final List<String> prefectures = [
    '地球', '火星', '木星', '土星', '金星', '水星', '太陽', 'ウラヌス', 'ネプチューン', 'トリトン',
    'プルートゥ', '赤い長方形星雲', 'エスキモー星雲', 'キャッツアイ星雲', '卵星雲', 'ひょうたん星雲', 'アルタイル', 'シリウス',
    'カノープス', 'ベガ', 'アルデバラン', 'ベテルギウス', 'デネブ', '惑星スナック', 'サイータ星', '魁皇星', '大マゼラン星雲',
    'ブータラ星', 'モスカンダグ', 'コロン星', 'ヤキソパーン', 'ウメ星', 'ダラララ', 'マイドムリ', 'メルトズ', 'ウラルー',
    'アグハムム', 'ソモロン', 'アバ・ブア', 'ティターン', 'デススタン', 'ゴリラの惑星', 'チョイバトロン星', 'クリムゾン星',
    'N77星雲', 'アンドロメダ', 'ブラックホール', 'ビッグバン',
  ];

  final Map<String, List<String>> prefectureImages = {
    "地球": ["041", "388"],
    "火星": ["001", "002", "169", "173", "360", "361"],
    "木星": ["007", "013", "168", "360"],
    "土星": ["001", "004", "008", "011", "169", "172"],
    "金星": ["001", "002", "167", "168", "360", "361"],
    "水星": ["010", "013", "015", "360", "361", "388"],
    "太陽": ["008", "014", "168", "170", "174", "365"],
    "ウラヌス": ["046", "167", "168", "177", "360"],
    "ネプチューン": ["362", "388"],
    "トリトン": ["169", "178", "360", "417"],
    "プルートゥ": ["000", "001", "002", "167", "171", "172", "362"],
    "赤い長方形星雲": ["004", "011", "014", "118", "170", "182", "360", "361"],
    "エスキモー星雲": ["005", "015", "361", "363", "388"],
    "キャッツアイ星雲": ["114", "115", "167", "171", "173", "361"],
    "卵星雲": ["015", "168", "175", "361", "388"],
    "ひょうたん星雲": ["046", "360", "362", "417"],
    "アルタイル": ["002", "170", "361", "363", "388", "418"],
    "シリウス": ["013", "168", "183", "360", "364"],
    "カノープス": ["047", "169", "361", "418"],
    "ベガ": ["046", "052", "168", "170", "417"],
    "アルデバラン": ["008", "017", "118", "360", "361", "418"],
    "ベテルギウス": ["113", "114", "115", "182", "184", "360", "388"],
    "デネブ": ["180", "184", "211", "362", "417"],
    "惑星スナック": ["008", "046", "113", "167", "169", "170", "361"],
    "サイータ星": ["022", "168", "173", "174", "360", "362"],
    "魁皇星": ["363", "365", "418"],
    "大マゼラン星雲": ["011", "014", "168", "170", "183"],
    "ブータラ星": ["167", "168", "184", "362", "417"],
    "モスカンダグ": ["047", "118", "365"],
    "コロン星": ["167", "168", "360", "361", "366"],
    "ヤキソパーン": ["015", "168", "172", "363", "388"],
    "ウメ星": ["004", "008", "011", "014", "038", "118"],
    "ダラララ": ["022", "178", "184", "360", "364", "417"],
    "マイドムリ": ["169", "175", "360", "361", "418"],
    "メルトズ": ["176", "361", "364"],
    "ウラルー": ["167", "177", "184"],
    "アグハムム": ["360", "361", "363", "388"],
    "ソモロン": ["010", "052", "182", "388", "418"],
    "アバ・ブア": ["182", "184", "366", "417"],
    "ティターン": ["004", "008", "038", "113", "114", "169", "170"],
    "デススタン": ["167", "171", "174", "361", "365"],
    "ゴリラの惑星": ["006", "051", "115", "362"],
    "チョイバトロン星": ["001", "002", "015", "046", "114", "118", "167", "168", "388"],
    "クリムゾン星": ["048", "178"],
    "N77星雲": ["002", "015", "047", "056", "147", "168", "364", "388"],
    "アンドロメダ": ["046", "113", "114", "118", "177", "360", "417", "418"],
    "ブラックホール": ["046", "361", "365", "366", "418"],
    "ビッグバン": ["360", "361", "417", "418", "419"],
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
                  // 第一章の処理を追加
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SpacePage()),
                  );
                },
                child: const Text('第一章'),
              ),
              ElevatedButton(
                onPressed: () {
                  // 第二章の処理を追加
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SpacePage2()),
                  );
                },
                child: const Text('第二章'),
              ),
              ElevatedButton(
                onPressed: () {
                  // 第三章の処理を追加
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SpacePage3()),
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
            const Text('宇宙編第2章'),
            const SizedBox(width: 8.0),  // テキストと画像の間にスペースを追加
            Image.network('https://i.pinimg.com/originals/fa/f1/c9/faf1c9c66bf0bd67a87f0a181ea21122.png', height: 50.0, width: 50.0),  // 画像のパスやサイズは適切に変更してください
          ],
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: prefectures.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    prefectures[index],
                    style: const TextStyle(fontSize: 24.0),
                  ),
                  const SizedBox(height: 20),
                  if (prefectureImages.containsKey(prefectures[index]))
                    ...prefectureImages[prefectures[index]]!
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