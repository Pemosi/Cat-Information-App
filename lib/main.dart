import 'package:flutter/material.dart';
import 'package:nyan_cat_war/src/app.dart';
import 'package:nyan_cat_war/src/screens/bgm_controller.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => BGMController(),
      child: MyApp(),  
    ),
  ); 
}