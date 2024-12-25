import 'package:flutter/material.dart';
import '../models/favorites_manager.dart';
import 'song_screen.dart';

class PopularScreen extends StatelessWidget {
  final List<Map<String, dynamic>> popularSongs = [
  
    {
      'title': 'Blinding Lights',
      'artist': 'The Weeknd',
      'imagePath': 'assets/images/image7.jpg',
      'mp3Path': 'music/music7.mp3',
    },
    {
      'title': 'Levitating',
      'artist': 'Dua Lipa',
      'imagePath': 'assets/images/image8.jpg',
      'mp3Path': 'music/music8.mp3',
    },
    {
      'title': 'Good 4 U',
      'artist': 'Olivia Rodrigo',
      'imagePath': 'assets/images/image9.jpg',
      'mp3Path': 'music/music9.mp3',
    },
    {
      'title': 'Peaches',
      'artist': 'Justin Bieber',
      'imagePath': 'assets/images/image10.jpg',
      'mp3Path': 'music/music10.mp3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Popular Songs",
        style: TextStyle(color: Colors.white),),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Popular Songs",
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<List<Map<String, dynamic>>>(
              valueListenable: favoritesManager.favoritesNotifier,
              builder: (context, favoriteSongs, _) {
                return ListView.builder(
                  itemCount: popularSongs.length,
                  itemBuilder: (context, index) {
                    final song = popularSongs[index];
                    final isFavorite = favoritesManager.isFavorite(song);

                    return ListTile(
                      leading: song['imagePath'] != null
                          ? Image.asset(song['imagePath']!)
                          : const Icon(Icons.music_note, color: Colors.white),
                      title: Text(
                        song['title'] ?? 'Unknown Title',
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        song['artist'] ?? 'Unknown Artist',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          if (isFavorite) {
                            favoritesManager.removeFavorite(song);
                          } else {
                            favoritesManager.addFavorite(song);
                          }
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SongScreen(
                              songList: popularSongs,
                              initialIndex: index,
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
