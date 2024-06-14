import 'package:flutter/material.dart';
import 'package:nyan_cat_war/src/screens/Descending/hell.dart';
import 'package:nyan_cat_war/src/screens/Festbaru/nyan_tou.dart';
import 'package:nyan_cat_war/src/screens/Various_stages/super_beast_home.dart';
import 'package:nyan_cat_war/src/screens/background_audio/nyan_cat_bgm.dart';
import 'package:nyan_cat_war/src/screens/bgm_controller.dart';
import 'package:nyan_cat_war/src/screens/ex/cat_ex.dart';
import 'package:nyan_cat_war/src/screens/japan/cat_jp.dart';
// import 'package:nyan_cat_war/src/screens/cat_jp.dart';
import 'package:nyan_cat_war/src/screens/ld/cat_ld.dart';
import 'package:nyan_cat_war/src/screens/universe/cat_universe.dart';
import 'package:nyan_cat_war/src/screens/world/cat_wd.dart';
import 'package:provider/provider.dart';

class CatHome extends StatefulWidget {
  const CatHome({Key? key}) : super(key: key);

  @override
  State<CatHome> createState() => _CatHomeState();
}

class _CatHomeState extends State<CatHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
   late BGMController bgmController;

  @override
  Widget build(BuildContext context) {
    bgmController = Provider.of<BGMController>(context);

    void stageChange(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('ステージ変更'),
            actions: [
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HellPage()),
                        );
                      }, 
                      child: const Text("降臨ステージ"),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SuperBeastPage()),
                        );
                      },
                      child: const Text('超獣ステージ'),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TowerPage()),
                        );
                      },
                      child: const Text('風雲にゃんこ塔'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const BackgroundAudio()),
                        );
                      },
                      child: const Text('BGM鑑賞ページ(まだテスト)'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SwitchListTile(
              title: const Text('BGM'),
              value: bgmController.isBGMPlaying,
              onChanged: (bool value) {
                bgmController.toggleBGMPlaying();
              },
              secondary: const Icon(Icons.music_note),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                stageChange(context);
              },
              child: const Text("他のステージ情報を見る"),
            )
          ],
        ),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'にゃんこ大戦争ステージ情報',
          style: TextStyle(
            color: Colors.pink,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                 Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const JapanPage())
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    'assets/stage_images/japan_cat.png', // 画像のパスを指定してください
                    width: 280, // 画像の幅
                    height: 280, // 画像の高さ
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WorldPage()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    'assets/stage_images/world_cat.png', // 画像のパスを指定してください
                    width: 280, // 画像の幅
                    height: 280, // 画像の高さ
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SpacePage()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    'assets/stage_images/universe_cat.png', // 画像のパスを指定してください
                    width: 280, // 画像の幅
                    height: 280, // 画像の高さ
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LegendPage()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    'assets/stage_images/legend_cat.png', // 画像のパスを指定してください
                    width: 280, // 画像の幅
                    height: 280, // 画像の高さ
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SpaceSpecialStage()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    'assets/stage_images/ex.png', // 画像のパスを指定してください
                    width: 280, // 画像の幅
                    height: 280, // 画像の高さ
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HellPage()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    'assets/stage_images/降臨祭.png', // 画像のパスを指定してください
                    width: 380, // 画像の幅
                    height: 380, // 画像の高さ
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
