import 'package:flutter/material.dart';
import '../models/audio_manager.dart';

class MiniPlayer extends StatelessWidget {
  final AudioManager _audioManager = AudioManager();

  MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _audioManager.currentSongPathNotifier,
      builder: (context, currentSongPath, child) {
        if (currentSongPath == null) {
          return const SizedBox.shrink(); // Hide mini-player if no song is playing
        }
        return GestureDetector(
          onTap: () {
            // Navigate to SongScreen with the current song
          },
          child: Container(
            color: Colors.black87,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Song Details
                Row(
                  children: [
                    const Icon(Icons.music_note, color: Colors.white, size: 32),
                    const SizedBox(width: 12),
                    Text(
                      "Now Playing: $currentSongPath",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                // Playback Controls
                ValueListenableBuilder(
                  valueListenable: _audioManager.isPlayingNotifier,
                  builder: (context, isPlaying, child) {
                    return IconButton(
                      icon: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (isPlaying) {
                          _audioManager.pause();
                        } else {
                          _audioManager.play(currentSongPath);
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
