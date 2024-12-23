import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SongScreen extends StatefulWidget {
  final String title;
  final String artist;
  final String mp3Path;
  final String imagePath;

  const SongScreen({
    super.key,
    required this.title,
    required this.artist,
    required this.mp3Path,
    required this.imagePath,
  });

  @override
  _SongScreenState createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _playAudio();
  }

  void _playAudio() async {
  print('Attempting to play: ${widget.mp3Path}');
  try {
    await _audioPlayer.play(AssetSource(widget.mp3Path));
    setState(() => isPlaying = true);
  } catch (e) {
    print('Error playing audio: $e');
  }
}


  void _togglePlayback() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.resume();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Song Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.imagePath,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            // Song Details
            Text(
              widget.title,
              style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.artist,
              style: const TextStyle(color: Colors.grey, fontSize: 18),
            ),
            const SizedBox(height: 24),
            // Play/Pause Button
            IconButton(
              icon: Icon(
                isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                size: 64,
                color: Colors.white,
              ),
              onPressed: _togglePlayback,
            ),
          ],
        ),
      ),
    );
  }
}
