import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:nyan_cat_war/src/screens/bgm_controller.dart';
import 'package:nyan_cat_war/src/screens/ld/cat_new_ld.dart';
import 'package:nyan_cat_war/src/screens/ld/screen%20transition/ld_image.dart';
import 'package:provider/provider.dart';

class LegendPage extends StatefulWidget {
  const LegendPage({super.key});

  @override
  State<LegendPage> createState() => _LegendPageState();
}

class _LegendPageState extends State<LegendPage> {
  final List<String> legend = [
    "伝説のはじまり",
    "情熱の国",
    "グルコサミン砂漠",
    "ネコども海を渡る",
    "見つめてキャッツアイ",
    "ウエスタン街道",
    "マグロ海域",
    "バンブー島",
    "ぷにぷに鍾乳洞",
    "ボルケーノ火山",
    "千里の道",
    "アオ・ザ・カナ",
    "軍艦島",
    "つめとぎの廊下",
    "パルテノン神殿",
    "ずんどこ海水浴場",
    "アルカトラズ島",
    "脱獄トンネル",
    "カポネの監獄",
    "シルクロード",
    "闇へと続く地下道",
    "魔王の豪邸",
    "終わりを告げる夜",
    "バトルロワイアル",
    "戦争のつめあと",
    "海を汚す悪しき者",
    "心と体、繋ぐもの",
    "脆弱性と弱酸性",
    "導かれしネコ達",
    "暗黒コスモポリス",
    "ガラ・パ・ゴス",
    "岩海苔半島",
    "恐ろし連邦",
    "亡者の住まう地",
    "絶島パンデミック",
    "ふくろのねずみランド",
    "ハリーウッド帝国",
    "こしぎんちゃくの浜辺",
    "雲泥温泉郷",
    "風待ちアイランド",
    "ITカタコンベ",
    "変覧会の絵",
    "エリア22",
    "超越サバンナ",
    "ブリザード自動車道",
    "シンギュラリティ村",
    "オワーリ大陸",
    "伝説のおわり",
    "古代研究所"
  ];

  final AudioPlayer _bgmPlayer = AudioPlayer();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (Provider.of<BGMController>(context).isBGMPlaying) {
      _bgmPlayer.play(AssetSource('太古の力.mp3'));
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
                  _bgmPlayer.stop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NewLegendPage()),
                  );
                },
                child: const Text('新レジェンドステージ'),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pop(context);
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => const JapanPage2()),
              //     );
              //   },
              //   child: const Text('第二章'),
              // ),
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
            const Text('旧レジェンドステージ'),
            const SizedBox(width: 8.0),  // テキストと画像の間にスペースを追加
            Image.network('https://i.pinimg.com/originals/fa/f1/c9/faf1c9c66bf0bd67a87f0a181ea21122.png', height: 50.0, width: 50.0),  // 画像のパスやサイズは適切に変更してください
          ],
        ),
      ),
      body: Container(
        color: Colors.black,
        child: ListView.builder(
          itemCount: legend.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.yellow[700],
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    String selectedPrefecture = legend[index];
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LegendImagePage(prefectureName: selectedPrefecture),
                      ),
                    );
                  },
                  child: Text(
                    legend[index],
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}