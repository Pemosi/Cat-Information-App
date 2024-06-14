import 'package:flutter/material.dart';
import 'package:nyan_cat_war/src/screens/universe/cat_universe.dart';
import 'package:nyan_cat_war/src/screens/universe/cat_universe2.dart';

class SpacePage3 extends StatefulWidget {
  const SpacePage3({super.key});

  @override
  State<SpacePage3> createState() => _SpacePage3State();
}

class _SpacePage3State extends State<SpacePage3> {

  final List<String> prefectures = [
    '地球', '火星', '木星', '土星', '金星', '水星', '太陽', 'ウラヌス', 'ネプチューン', 'トリトン',
    'プルートゥ', '赤い長方形星雲', 'エスキモー星雲', 'キャッツアイ星雲', '卵星雲', 'ひょうたん星雲', 'アルタイル', 'シリウス',
    'カノープス', 'ベガ', 'アルデバラン', 'ベテルギウス', 'デネブ', '惑星スナック', 'サイータ星', '魁皇星', '大マゼラン星雲',
    'ブータラ星', 'モスカンダグ', 'コロン星', 'ヤキソパーン', 'ウメ星', 'ダラララ', 'マイドムリ', 'メルトズ', 'ウラルー',
    'アグハムム', 'ソモロン', 'アバ・ブア', 'ティターン', 'デススタン', 'ゴリラの惑星', 'チョイバトロン星', 'クリムゾン星',
    'N77星雲', 'アンドロメダ', 'ブラックホール', 'ビッグバン',
  ];

  final Map<String, List<String>> prefectureImages = {
    "地球": ["417", "443"],
    "火星": ["002", "118", "169", "173", "360", "361"],
    "木星": ["007", "013", "168", "360", "362"],
    "土星": ["001", "004", "008", "011", "172", "360"],
    "金星": ["168", "175", "360", "361", "418"],
    "水星": ["013", "015", "182", "360", "361", "417"],
    "太陽": ["014", "168", "174", "182", "365", "418"],
    "ウラヌス": ["046", "167", "168", "177", "362"],
    "ネプチューン": ["173", "363", "443"],
    "トリトン": ["178", "183", "360", "417"],
    "プルートゥ": ["000", "001", "002", "167", "171", "172", "362"],
    "赤い長方形星雲": ["011", "015", "038", "168", "443"],
    "エスキモー星雲": ["167", "168", "175", "184", "363", "444"],
    "キャッツアイ星雲": ["114", "167", "171", "173", "361", "362"],
    "卵星雲": ["015", "175", "360", "361", "388"],
    "ひょうたん星雲": ["167", "360", "362", "417"],
    "アルタイル": ["146", "362", "363", "388", "443"],
    "シリウス": ["013", "168", "174", "183", "444"],
    "カノープス": ["047", "360", "361", "365"],
    "ベガ": ["046", "052", "168", "170", "182", "417"],
    "アルデバラン": ["014", "017", "170", "366", "444"],
    "ベテルギウス": ["113", "114", "115", "182", "360", "443"],
    "デネブ": ["167", "361", "445"],
    "惑星スナック": ["008", "046", "113", "167", "169", "170", "361"],
    "サイータ星": ["168", "174", "360", "362", "388"],
    "魁皇星": ["363", "364", "445"],
    "大マゼラン星雲": ["011", "014", "168", "170", "183", "444"],
    "ブータラ星": ["167", "168", "362", "417", "443"],
    "モスカンダグ": ["047", "118", "365"],
    "コロン星": ["167", "168", "360", "361", "443"],
    "ヤキソパーン": ["015", "168", "172", "388", "444"],
    "ウメ星": ["004", "008", "011", "014", "038", "118"],
    "ダラララ": ["022", "184", "209", "360", "445"],
    "マイドムリ": ["169", "175", "360", "361", "418"],
    "メルトズ": ["171", "176", "360", "443"],
    "ウラルー": ["167", "177", "184"],
    "アグハムム": ["047", "147", "360", "361", "363"],
    "ソモロン": ["010", "052", "182", "365"],
    "アバ・ブア": ["182", "184", "417", "445"],
    "ティターン": ["004", "008", "038", "113", "114", "169", "170", "443"],
    "デススタン": ["167", "171", "174", "361", "365"],
    "ゴリラの惑星": ["006", "051", "115", "362"],
    "チョイバトロン星": ["001", "002", "015", "046", "114", "118", "168", "360", "443"],
    "クリムゾン星": ["004", "038", "178"],
    "N77星雲": ["002", "015", "047", "056", "147", "361", "364", "388", "418"],
    "アンドロメダ": ["046", "113", "114", "118", "177", "360", "366", "444"],
    "ブラックホール": ["360", "361", "443", "445"],
    "ビッグバン": ["360", "361", "362", "417", "443", "446"],
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
                    MaterialPageRoute(builder: (context) => const SpacePage()),
                  );
                },
                child: const Text('第一章'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SpacePage2()),
                  );
                },
                child: const Text('第二章'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
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
            const Text('宇宙編第3章'),
            const SizedBox(width: 8.0),  // テキストと画像の間にスペースを追加
            Flexible(child: Image.network('https://i.pinimg.com/originals/fa/f1/c9/faf1c9c66bf0bd67a87f0a181ea21122.png', height: 50.0, width: 50.0)),
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