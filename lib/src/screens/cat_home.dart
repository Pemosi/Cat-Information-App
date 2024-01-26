import 'package:flutter/material.dart';
import 'package:nyan_cat_war/src/screens/bgm_controller.dart';
import 'package:nyan_cat_war/src/screens/ex/cat_ex.dart';
import 'package:nyan_cat_war/src/screens/japan/cat_jp.dart';
// import 'package:nyan_cat_war/src/screens/cat_jp.dart';
import 'package:nyan_cat_war/src/screens/cat_ld.dart';
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

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Switch(
          value: bgmController.isBGMPlaying,
          onChanged: (bool value) {
            bgmController.toggleBGMPlaying();
          },
        ), 
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'にゃんこ大戦争のいろんな情報！くん',
          style: TextStyle(
            color: Colors.pink,
            fontSize: 23,
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
            ],
          );
        },
      ),
    );
  }
}
