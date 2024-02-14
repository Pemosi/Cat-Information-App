import 'package:flutter/material.dart';

class NewLegendPage extends StatefulWidget {
  const NewLegendPage({super.key});

  @override
  State<NewLegendPage> createState() => _NewLegendPageState();
}

class _NewLegendPageState extends State<NewLegendPage> {
  final List<String> newlegend = [
    "1.真伝説のはじまり",
    "2.まんぷく秘境",
    "3.アドベン大森林",
    "4.じゃぶじゃぶ旧海道",
    "5.ワンワン湾",
    "6.深淵を覗く者",
    "7.デスメガシティ",
    "8.無法地帯のオキテ",
    "9.パラリラ半島",
    "10.キャットクーデター",
    "11.桜んぼ島",
    "12.魂底からの帰化",
    "13.絶滅海洋タウン",
    "14.島流しリゾート",
    "15.まどいの魔道路",
    "16.天界バル横丁",
    "17.バトル銭湯",
    "18.はえぬき三連山",
    "19.マリン官邸",
    "20.学園に巣くう悪意",
    "21.ところてん金鉱",
    "22.酩酊製鉄所",
    "23.暴かれし神殿の秘宝",
    "24.帝政エイジャナイカ",
    "25.鋼鉄スポーツジム",
    "26.明星おきの島",
    "27.眠れる森の何か",
    "28.ラボラトリ島",
    "29.忘らるる墓所",
    "30.始まりを告げる朝",
    "31.ハッピーラッキー寺院",
    "32.キネマ怪館",
    "33.ダイバー都市",
    "34.ナシゴレン",
    "35.DNA果樹園",
    "36.古代樹の迷宮",
    "37.立ちはだかる者達の城",
    "38.時空のゆがみ",
    "39.大厄災のはじまり",
    "40.魔海域ビックラ港",
    "41.デッドヒートランド",
    "42.バラ色の袋小路",
    "43.千年獣の霊峰",
    "44.ムーディストビーチ",
    "45.猫追いしふるさと",
    "46.海賊王商店街",
    "47.真なる虚実を紡ぐ道",
    "48.人類ネコ化計画",
    "49.古代神樹",
  ];
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
            const Text('旧レジェンドステージ'),
            const SizedBox(width: 8.0),  // テキストと画像の間にスペースを追加
            Image.network('https://i.pinimg.com/originals/fa/f1/c9/faf1c9c66bf0bd67a87f0a181ea21122.png', height: 50.0, width: 50.0),  // 画像のパスやサイズは適切に変更してください
          ],
        ),
      ),
      
    );
  }
}