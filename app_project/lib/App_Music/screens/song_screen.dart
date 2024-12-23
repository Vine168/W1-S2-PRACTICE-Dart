import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SongScreen extends StatefulWidget {
  final List<Map<String, dynamic>> songList;
  final int initialIndex;

  const SongScreen({
    super.key,
    required this.songList,
    required this.initialIndex,
  });

  @override
  _SongScreenState createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;
  bool isLoading = false;
  Duration currentPosition = Duration.zero;
  Duration songDuration = Duration.zero;
  int currentSongIndex = 0;

  @override
  void initState() {
    super.initState();
    currentSongIndex = widget.initialIndex;
    _audioPlayer = AudioPlayer();
    _loadSong();

    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        currentPosition = position;
      });
    });

    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        songDuration = duration;
      });
    });

    _audioPlayer.onPlayerComplete.listen((_) {
      _playNext(); // Automatically play the next song
    });
  }

  Future<void> _loadSong() async {
    if (widget.songList.isEmpty) return;

    final song = widget.songList[currentSongIndex];
    setState(() {
      isLoading = true;
      isPlaying = false;
    });

    try {
      await _audioPlayer.setSource(AssetSource(song['mp3Path']));
      await _audioPlayer.resume();
      setState(() {
        isPlaying = true;
      });
    } catch (e) {
      print('Error loading song: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load song: ${song['title']}')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
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

  void _seekTo(double seconds) {
    _audioPlayer.seek(Duration(seconds: seconds.toInt()));
  }

  void _playNext() {
    if (currentSongIndex < widget.songList.length - 1) {
      setState(() {
        currentSongIndex++;
      });
      _loadSong();
    }
  }

  void _playPrevious() {
    if (currentSongIndex > 0) {
      setState(() {
        currentSongIndex--;
      });
      _loadSong();
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.songList.isEmpty) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            'No songs available',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      );
    }

    final song = widget.songList[currentSongIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(song['title'], style: const TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Song Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      song['imagePath'],
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Song Details
                  Text(
                    song['title'],
                    style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    song['artist'],
                    style: const TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  const SizedBox(height: 24),
                  // Timeline
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Slider(
                          activeColor: Colors.white,
                          inactiveColor: Colors.grey,
                          min: 0,
                          max: songDuration.inSeconds.toDouble(),
                          value: currentPosition.inSeconds.toDouble().clamp(0, songDuration.inSeconds.toDouble()),
                          onChanged: _seekTo,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _formatDuration(currentPosition),
                              style: const TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            Text(
                              _formatDuration(songDuration),
                              style: const TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Playback Controls
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.skip_previous, color: Colors.white, size: 48),
                        onPressed: currentSongIndex > 0 ? _playPrevious : null,
                      ),
                      IconButton(
                        icon: Icon(
                          isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                          size: 64,
                          color: Colors.white,
                        ),
                        onPressed: _togglePlayback,
                      ),
                      IconButton(
                        icon: const Icon(Icons.skip_next, color: Colors.white, size: 48),
                        onPressed: currentSongIndex < widget.songList.length - 1 ? _playNext : null,
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}
