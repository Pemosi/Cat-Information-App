import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class LegendStagePage extends StatelessWidget {

  final String stageName;

  const LegendStagePage({super.key, required this.stageName});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: FutureBuilder(
        future: FirebaseDatabase.instance
          .reference()
          .child("stages")
          .child(stageName)
          .once(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final enemyImages = snapshot.data!.value as List<String>;
            return ListView.builder(
              itemCount: enemyImages.length,
              itemBuilder: (context, index) {
                return Image.network(enemyImages[index]);
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );

  }

}