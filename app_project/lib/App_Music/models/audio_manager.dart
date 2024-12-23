import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();
  factory AudioManager() => _instance;

  final AudioPlayer _audioPlayer = AudioPlayer();
  final ValueNotifier<bool> isPlayingNotifier = ValueNotifier(false);
  final ValueNotifier<String?> currentSongPathNotifier = ValueNotifier(null);

  AudioManager._internal() {
    _audioPlayer.onPlayerStateChanged.listen((state) {
      isPlayingNotifier.value = state == PlayerState.playing;
    });
  }

  Future<void> play(String path) async {
    currentSongPathNotifier.value = path;
    await _audioPlayer.setSource(AssetSource(path));
    await _audioPlayer.resume();
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
  }
}
