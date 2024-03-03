import 'dart:async';
import 'package:flutter/material.dart';
import 'package:volume_control/volume_control.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class NyanCatVideoPage extends StatefulWidget {
  final String videoId;
  final String title;
  final String thumbnailUrl;

  const NyanCatVideoPage({Key? key, required this.videoId, required this.title, required this.thumbnailUrl}) : super(key: key); // Key? を Key? key に修正

  @override
  State<NyanCatVideoPage> createState() => _NyanCatVideoPageState();
}

class _NyanCatVideoPageState extends State<NyanCatVideoPage> {
  late YoutubePlayerController _controller;
  // ignore: unused_field
  late YoutubeMetaData _videoMetaData;
  late String nowVideoId;
  bool isMuted = false;
  double _val = 0.0; // 初期ボリューム値
  double _previousVolume = 0.0; // ミュート前のボリューム値
  Timer? timer;
  // final AudioPlayer _bgmPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    initVolumeState();
    setState(() {
      nowVideoId = widget.videoId;
      _videoMetaData = const YoutubeMetaData();
      setYouTube();
    });
  }

  Future<void> initVolumeState() async {
    if (!mounted) return;
    _val = await VolumeControl.volume;
    setState(() {});
  }

  void setYouTube() {
    setState(() {
      _controller = YoutubePlayerController(
        initialVideoId: nowVideoId,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          hideControls: false,
          controlsVisibleAtStart: true,
          enableCaption: true,
          captionLanguage: 'en',
          forceHD: true,
        ),
      );
      _controller.addListener(listener);
    });
  }

  void onRepeatIconPressed() {
    setState(() {
      isMuted = !isMuted;
      if (isMuted) {
        _previousVolume = _val; // ミュート前のボリューム値を保持
        _controller.mute();
        _val = 0.0; // ミュート時のボリューム値を0に設定
      } else {
        _controller.unMute();
        _val = _previousVolume; // ミュート前のボリューム値に戻す
      }
    });
  }

  void listener() {
    if (_controller.value.isReady) {
      setState(() {
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  IconButton muteButton() {
    return IconButton(
      icon: isMuted ? const Icon(Icons.volume_off) : const Icon(Icons.volume_up),
      onPressed: onRepeatIconPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('攻略動画'),
            SizedBox(width: 8.0),
            Image(
              image: NetworkImage('https://i.pinimg.com/originals/fa/f1/c9/faf1c9c66bf0bd67a87f0a181ea21122.png'),
              height: 50.0,
              width: 50.0,
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          icon: const Icon(Icons.arrow_back_ios_new)
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: YoutubePlayer(
              controller: _controller,
              aspectRatio: 16/9,
              showVideoProgressIndicator: false,
              progressIndicatorColor: Colors.amber,
              progressColors: const ProgressBarColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent,
              ),
              onReady: () {
                _videoMetaData = _controller.metadata;
              },
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                muteButton(),
                const Text(
                  "Volume:",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Slider(
                  value: isMuted ? 0.0 : _val, // ミュート時は0に設定
                  min: 0,
                  max: 1,
                  divisions: 100,
                  onChanged: (val) {
                    _val = val;
                    setState(() {});
                    if (!isMuted) {
                      if (timer != null) {
                        timer?.cancel();
                      }
                      timer = Timer(const Duration(milliseconds: 200), () {
                        VolumeControl.setVolume(val);
                      });
                      print("val: $val");
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}