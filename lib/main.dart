import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nyan_cat_war/firebase_options.dart';
import 'package:nyan_cat_war/src/app.dart';
import 'package:nyan_cat_war/src/screens/bgm_controller.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (_) => BGMController(),
      child: MyApp(),
    ),
  ); 
}