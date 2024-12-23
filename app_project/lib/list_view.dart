import 'package:flutter/material.dart';
import 'database_helper.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({super.key});

  @override
  _SongScreenState createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  final dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> songs = [];

  @override
  void initState() {
    super.initState();
    loadSongs();
  }

  void loadSongs() async {
    List<Map<String, dynamic>> data = await dbHelper.getAllSongs();
    setState(() {
      songs = data;
    });
  }

  void deleteSong(int id) async {
    await dbHelper.deleteSong(id);
    loadSongs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Song List')),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          final song = songs[index];
          return ListTile(
            title: Text(song['title']),
            subtitle: Text('Artist: ${song['artist']}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => deleteSong(song['id']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Example to add a new song
          await dbHelper.insertSong({
            'title': 'New Song',
            'artist': 'Unknown Artist',
            'duration': '3:30',
            'filePath': '/path/to/new_song.mp3',
          });
          loadSongs();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
