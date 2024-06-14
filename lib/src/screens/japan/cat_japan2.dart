import 'package:flutter/material.dart';
import 'package:nyan_cat_war/src/screens/japan/cat_japan3.dart';
import 'package:nyan_cat_war/src/screens/japan/cat_jp.dart';

class JapanPage2 extends StatefulWidget {
  const JapanPage2({super.key});

  @override
  State<JapanPage2> createState() => _JapanPage2State();
}

class _JapanPage2State extends State<JapanPage2> {

  final List<String> prefectures = [
    '長崎県', '佐賀県', '鹿児島県', '熊本県', '宮崎県', '大分県', '福岡県',
    '高知県', '愛媛県', '徳島県', '香川県',
    '山口県', '広島県', '島根県', '岡山県', '鳥取県', '兵庫県',
    '和歌山県', '大阪府', '京都府', '奈良県', '三重県', '滋賀県',
    '福井県', '石川県', '愛知県', '岐阜県', '富山県', 
    '静岡県', '山梨県', '長野県', '新潟県',
    '神奈川県', '千葉県', '東京都', '埼玉県', '群馬県', '栃木県', '茨城県',
    '福島県', '宮城県', '山形県', '岩手県', '秋田県', '青森県',
    '北海道',
    '沖縄県', '西表島',
  ];

  final Map<String, List<String>> prefectureImages = {
    "長崎県": ["000"],
    "佐賀県": ["000", "001"],
    "鹿児島県": ["000", "001"],
    "熊本県": ["000", "001", "002"],
    "宮崎県": ["000", "001", "002"],
    "大分県": ["000", "001", "002"],
    "福岡県": ["000", "001", "002", "003"],
    "高知県": ["000", "001", "002"],
    "愛媛県": ["000", "001", "002"],
    "徳島県": ["000", "001", "002", "004"],
    "香川県": ["000", "001", "002", "003"],
    "山口県": ["000", "001", "002", "004"],
    "広島県": ["000", "001", "002", "005"],
    "島根県": ["000", "001", "002", "003"],
    "岡山県": ["000", "001", "002", "003", "004"],
    "鳥取県": ["000", "002", "006"],
    "兵庫県": ["000", "001", "002", "003", "004", "005"],
    "和歌山県": ["000", "001", "002", "004", "005"],
    "大阪府": ["002", "006", "007"],
    "京都府": ["000", "001", "002", "003", "004", "006", "007"],
    "奈良県": ["000", "001", "002", "003", "004", "005", "006", "007"],
    "三重県": ["001", "002", "005", "006", "007"],
    "滋賀県": ["002", "004", "008"],
    "福井県": ["003", "004", "005", "006"],
    "石川県": ["000", "001", "002", "003", "005", "007"],
    "愛知県": ["008", "013"],
    "岐阜県": ["000", "001", "002", "006", "007", "008", "013"],
    "富山県": ["000", "001", "002", "003", "004", "005", "006", "008", "013"],
    "静岡県": ["000", "001", "002", "009", "013"],
    "山梨県": ["001", "002", "003", "004", "005", "006", "007", "008", "013"],
    "長野県": ["002", "004", "007", "009", "013"],
    "新潟県": ["002", "004", "008", "014"],
    "神奈川県": ["001", "002", "003", "004", "005", "006", "007", "008", "013"],
    "千葉県": ["001", "002", "003", "004", "005", "006", "007", "008", "013"],
    "東京都": ["000", "001", "002", "010", "013", "014"],
    "埼玉県": ["000", "001", "002", "003", "004", "007", "009", "013", "014"],
    "群馬県": ["000", "001", "002", "003", "004", "007", "010", "013", "014"],
    "栃木県": ["000", "002", "006", "013", "015", "022"],
    "茨城県": ["000", "001", "002", "005", "006", "008", "015"],
    "福島県": ["000", "001", "002", "005", "006", "008", "009", "010", "015"],
    "宮城県": ["002", "011", "013", "015"],
    "山形県": ["000", "001", "002", "005", "006", "008", "009", "010", "015"],
    "岩手県": ["000", "001", "002", "004", "008", "011", "013", "014"],
    "秋田県": ["000", "001", "002", "012", "015"],
    "青森県": ["003", "004", "005", "006", "008", "009", "010", "022"],
    "北海道": ["004", "012", "014", "015", "022"],
    "沖縄県": ["002", "003", "005", "006", "008", "009", "010", "011", "012"],
    "西表島": ["002", "003", "005", "011", "013", "015", "023"],
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
                    MaterialPageRoute(builder: (context) => const JapanPage()),
                  );
                },
                child: const Text('第一章'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const JapanPage2()),
                  );
                },
                child: const Text('第二章'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const JapanPage3()),
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
            const Text('日本編第2章'),
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