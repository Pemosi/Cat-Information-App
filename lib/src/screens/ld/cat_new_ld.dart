import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:nyan_cat_war/src/screens/bgm_controller.dart';
import 'package:nyan_cat_war/src/screens/ld/screen%20transition/new_ld_image.dart';
import 'package:provider/provider.dart';

class NewLegendPage extends StatefulWidget {
  const NewLegendPage({super.key});

  @override
  State<NewLegendPage> createState() => _NewLegendPageState();
}

class _NewLegendPageState extends State<NewLegendPage> {
  final List<String> newlegend = [
    "真伝説のはじまり",
    "まんぷく秘境",
    "アドベン大森林",
    "じゃぶじゃぶ旧海道",
    "ワンワン湾",
    "深淵を覗く者",
    "デスメガシティ",
    "無法地帯のオキテ",
    "パラリラ半島",
    "キャットクーデター",
    "桜んぼ島",
    "魂底からの帰化",
    "絶滅海洋タウン",
    "島流しリゾート",
    "まどいの魔道路",
    "天界バル横丁",
    "バトル銭湯",
    "はえぬき三連山",
    "マリン官邸",
    "学園に巣くう悪意",
    "ところてん金鉱",
    "酩酊製鉄所",
    "暴かれし神殿の秘宝",
    "帝政エイジャナイカ",
    "鋼鉄スポーツジム",
    "明星おきの島",
    "眠れる森の何か",
    "ラボラトリ島",
    "忘らるる墓所",
    "始まりを告げる朝",
    "ハッピーラッキー寺院",
    "キネマ怪館",
    "ダイバー都市",
    "ナシゴレン",
    "DNA果樹園",
    "古代樹の迷宮",
    "立ちはだかる者達の城",
    "時空のゆがみ",
    "大厄災のはじまり",
    "魔海域ビックラ港",
    "デッドヒートランド",
    "バラ色の袋小路",
    "千年獣の霊峰",
    "ムーディストビーチ",
    "猫追いしふるさと",
    "海賊王商店街",
    "真なる虚実を紡ぐ道",
    "人類ネコ化計画",
    "古代神樹",
  ];

  final AudioPlayer _bgmPlayer = AudioPlayer();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (Provider.of<BGMController>(context).isBGMPlaying) {
      _bgmPlayer.play(AssetSource('古代の呪い.mp3'));
      _bgmPlayer.setReleaseMode(ReleaseMode.loop);
      // BGMController controller = Provider.of<BGMController>(context); 
      // controller.currentBGMPath = '古代の呪い.mp3';
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
        // actions: [
        //   IconButton(
        //     onPressed: () => _showChapterDialog(),
        //     icon: const Icon(Icons.menu),
        //   ),
        // ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('新レジェンドステージ'),
            const SizedBox(width: 8.0),  // テキストと画像の間にスペースを追加
            Image.network('https://i.pinimg.com/originals/fa/f1/c9/faf1c9c66bf0bd67a87f0a181ea21122.png', height: 50.0, width: 50.0),  // 画像のパスやサイズは適切に変更してください
          ],
        ),
      ),
      body: Container(
        color: Colors.black,
        child: ListView.builder(
          itemCount: newlegend.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    String selectedPrefecture = newlegend[index];
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewLegendImagePage(prefectureName: selectedPrefecture, newLegendBgm: _bgmPlayer,),
                      ),
                    );
                  },
                  child: Text(
                    newlegend[index],
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