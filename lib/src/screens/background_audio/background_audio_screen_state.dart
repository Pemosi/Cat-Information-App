import 'dart:async';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:nyan_cat_war/src/screens/background_audio/audio_handler.dart';
import 'package:nyan_cat_war/src/screens/background_audio/service_locator.dart';
import 'package:rxdart/rxdart.dart';

class BackgroundAudioScreenState extends ChangeNotifier {
  ProgressBarState progressBarState = ProgressBarState(
    current: Duration.zero,
    buffered: Duration.zero,
    total: Duration.zero,
  );
  AudioState audioState = AudioState.paused;
  late StreamSubscription _playbackSubscription;
  late StreamSubscription _progressBarSubscription;
  MediaItem? _currentMediaItem;  // 現在再生中の曲

  final AudioServiceHandler _handler = getIt<AudioServiceHandler>();

  List<MediaItem> get playlist => _playlist;

  static final List<MediaItem> _playlist = [
    MediaItem(
      id: 'assets/bgm/スターフィリバスター.mp3',
      album: "にゃんこBGM",
      title: "宇宙の危機！スターフィリバスター",
      artist: "PONOS",
      artUri: Uri.parse('https://image02.seesaawiki.jp/b/i/battlecatswiki/ef44967993c6f9df.png'),
    ),
    MediaItem(
      id: 'assets/bgm/消滅都市.mp3',
      album: "にゃんこBGM",
      title: "消滅都市 X にゃんこ大戦争コラボ",
      artist: "PONOS",
      artUri: Uri.parse('https://i.pinimg.com/originals/fa/f1/c9/faf1c9c66bf0bd67a87f0a181ea21122.png'),
    ),
    // 他の曲も追加
  ];

  void init() {
    _handler.initPlayer(_playlist);
    _listenToPlaybackState();
    _listenForProgressBarState();
  }

  void _listenToPlaybackState() {
    _playbackSubscription =
        _handler.playbackState.listen((PlaybackState state) {
      debugPrint('current state:${state.processingState}');
      debugPrint('playing:${state.playing}');
      _currentMediaItem = _handler.mediaItem.value;
      notifyListeners();  // 再生中の曲が変わった時にUIを更新する

      if (isLoadingState(state)) {
        setAudioState(AudioState.loading);
      } else if (isAudioReady(state)) {
        setAudioState(AudioState.ready);
      } else if (isAudioPlaying(state)) {
        setAudioState(AudioState.playing);
      } else if (isAudioPaused(state)) {
        setAudioState(AudioState.paused);
      } else if (hasCompleted(state)) {
        setAudioState(AudioState.paused);
      }
    });
  }

  void _listenForProgressBarState() {
    _progressBarSubscription = CombineLatestStream.combine3(
      AudioService.position,
      _handler.playbackState,
      _handler.mediaItem,
      (Duration current, PlaybackState state, MediaItem? mediaItem) =>
      ProgressBarState(
        current: current,
        buffered: state.bufferedPosition,
        total: mediaItem?.duration ?? Duration.zero,
      ),
    ).listen((ProgressBarState state) => setProgressBarState(state));
  }

  bool isLoadingState(PlaybackState state) {
    return state.processingState == AudioProcessingState.loading ||
        state.processingState == AudioProcessingState.buffering;
  }

  bool isAudioReady(PlaybackState state) {
    return state.processingState == AudioProcessingState.ready &&
        !state.playing;
  }

  bool isAudioPlaying(PlaybackState state) {
    return state.playing && !hasCompleted(state);
  }

  bool isAudioPaused(PlaybackState state) {
    return !state.playing && !isLoadingState(state);
  }

  bool hasCompleted(PlaybackState state) {
    return state.processingState == AudioProcessingState.completed;
  }

  @override
  void dispose() {
    _handler.stop();
    _playbackSubscription.cancel();
    _progressBarSubscription.cancel();
    super.dispose();
  }

  void setAudioState(AudioState state) {
    audioState = state;
    notifyListeners();
  }

  void setProgressBarState(ProgressBarState state) {
    progressBarState = state;
    notifyListeners();
  }

  void play() => _handler.play();

  void pause() => _handler.pause();

  void seek(Duration position) => _handler.seek(position);

  void stop() => _handler.stop();

  void playTrack(MediaItem item) {
    _handler.stop();  // 現在の再生を停止
    _handler.initPlayer([item]);  // 選択された曲を再生
    _handler.play();
  }

  void skipToNext() => _handler.skipToNext();

  void skipToPrevious() => _handler.skipToPrevious();

  MediaItem? getCurrentTrack() => _currentMediaItem;  // 現在再生中の曲を取得
}

class ProgressBarState {
  ProgressBarState({
    required this.current,
    required this.buffered,
    required this.total,
  });

  final Duration current;
  final Duration buffered;
  final Duration total;
}

enum AudioState {
  ready,
  paused,
  playing,
  loading,
}