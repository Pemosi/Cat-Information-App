// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nyan_cat_war/src/screens/cat_home.dart';

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    // createDirectory();
  }

  // List prefectures = [
  //   '長崎県', '佐賀県', '鹿児島県', '熊本県', '宮崎県', '大分県', '福岡県',
  //   '高知県', '愛媛県', '徳島県', '香川県',
  //   '山口県', '広島県', '島根県', '岡山県', '鳥取県', '兵庫県',
  //   '和歌山県', '大阪府', '京都府', '奈良県', '三重県', '滋賀県',
  //   '福井県', '石川県', '愛知県', '岐阜県', '富山県', 
  //   '静岡県', '山梨県', '長野県', '新潟県',
  //   '神奈川県', '千葉県', '東京都', '埼玉県', '群馬県', '栃木県', '茨城県',
  //   '福島県', '宮城県', '山形県', '岩手県', '秋田県', '青森県',
  //   '北海道',
  //   '沖縄県', '西表島'
  // ];
  
  // Future<void> createDirectory() async {

  //   for (int i=0; i < prefectures.length; i++){

  //     final prefectureName = prefectures[i];
  //     final String newdirpath = '/Users/muratareo/Desktop/nyan_cat_war/assets/images/$prefectureName';

  //     final Directory newdir = Directory(newdirpath);

  //     bool direxists = await newdir.exists();

  //     if (!direxists) {
  //       await Directory(newdirpath).create(recursive: true);
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CatHome(),
    );
  }
}
