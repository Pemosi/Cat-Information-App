import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nyan_cat_war/src/screens/bgm_controller.dart';
import 'package:nyan_cat_war/src/screens/video.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  final String name;
  const SearchPage({super.key, required this.name});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> searchResults = [];

  Future<void> searchVideos(String query) async {
    const String apiKey = 'AIzaSyB703gSnn7zwJ6Tm6VHDczkvslXZFq-TGs'; // ここにYouTubeのAPIキーを設定してください
    const String apiUrl = 'https://www.googleapis.com/youtube/v3/search?part=snippet&type=video&maxResults=10&key=$apiKey&q=';
    final response = await http.get(Uri.parse('$apiUrl$query'));

    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> data = json.decode(response.body);
        searchResults = data['items'];
      });
    } else {
      throw Exception('Failed to search videos');
    }
  }

  @override
  void initState() {
    super.initState();
    _searchController.text = 'にゃんこ大戦争${widget.name}';
    searchVideos(_searchController.text); // 初期値での検索を行う
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('攻略動画検索ページ'),
            const SizedBox(width: 8.0),
            Image.network('https://i.pinimg.com/originals/fa/f1/c9/faf1c9c66bf0bd67a87f0a181ea21122.png', height: 50.0, width: 50.0),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: (query) {
                searchVideos(query); // テキストが変更されたら検索を行う
              },
              decoration: InputDecoration(
                hintText: "",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      searchResults = []; // クリア時に検索結果もリセット
                    });
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (BuildContext context, int index) {
                final video = searchResults[index];
                final String videoId = video['id']['videoId'];
                final String title = video['snippet']['title'];
                final String thumbnailUrl = video['snippet']['thumbnails']['medium']['url'];

                return Card(
                  child: ListTile(
                    leading: Image.network(thumbnailUrl),
                    title: Text(title),
                    onTap: () {
                      Provider.of<BGMController>(context, listen: false).pauseBGM();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NyanCatVideoPage(
                            videoId: videoId,
                            thumbnailUrl: thumbnailUrl, 
                            title: title,
                          )
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
