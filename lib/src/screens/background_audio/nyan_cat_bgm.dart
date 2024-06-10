import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:nyan_cat_war/src/screens/background_audio/background_audio_screen_state.dart';
import 'package:provider/provider.dart';

class BackgroundAudio extends StatefulWidget {
  const BackgroundAudio({super.key});

  @override
  State<BackgroundAudio> createState() => _BackgroundAudioState();
}

class _BackgroundAudioState extends State<BackgroundAudio> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BackgroundAudioScreenState()..init(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('にゃんこBGM鑑賞ページ'),
        ),
        body: const _AudioPlayerUI(),
      ),
    );
  }
}

class _AudioPlayerUI extends StatelessWidget {
  const _AudioPlayerUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Selector<BackgroundAudioScreenState, ProgressBarState>(
            selector: (_, state) => state.progressBarState,
            builder: (_, progressBarState, __) => ProgressBar(
              progress: progressBarState.current,
              buffered: progressBarState.buffered,
              total: progressBarState.total,
              onSeek: (duration) =>
                  context.read<BackgroundAudioScreenState>().seek(duration),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.skip_previous),
                onPressed: () =>
                    context.read<BackgroundAudioScreenState>().skipToPrevious(),
              ),
              Selector<BackgroundAudioScreenState, AudioState>(
                selector: (_, state) => state.audioState,
                builder: (_, audioState, __) {
                  switch (audioState) {
                    case AudioState.loading:
                      return const CircularProgressIndicator();
                    case AudioState.ready:
                    case AudioState.paused:
                      return ElevatedButton(
                        onPressed: () =>
                            context.read<BackgroundAudioScreenState>().play(),
                        child: const Text('Play'),
                      );
                    case AudioState.playing:
                      return ElevatedButton(
                        onPressed: () =>
                            context.read<BackgroundAudioScreenState>().pause(),
                        child: const Text('Pause'),
                      );
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.skip_next),
                onPressed: () =>
                    context.read<BackgroundAudioScreenState>().skipToNext(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}