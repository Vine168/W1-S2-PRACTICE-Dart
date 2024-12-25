import 'package:flutter/material.dart';
import '../models/favorites_manager.dart';
import 'song_screen.dart';

class RecentScreen extends StatelessWidget {
  final List<Map<String, dynamic>> recentSongs = [
    {
      'title': 'Save Your Tears',
      'artist': 'The Weeknd',
      'imagePath': 'assets/images/image11.jpg',
      'mp3Path': 'music/music11.mp3',
    },
    {
      'title': 'Industry Baby',
      'artist': 'Lil Nas X',
      'imagePath': 'assets/images/image12.jpg',
      'mp3Path': 'music/music12.mp3',
    },
    {
      'title': 'Montero (Call Me By Your Name)',
      'artist': 'Lil Nas X',
      'imagePath': 'assets/images/image13.jpg',
      'mp3Path': 'music/music13.mp3',
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Recent Songs", 
        style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Recent Songs",
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<List<Map<String, dynamic>>>(
              valueListenable: favoritesManager.favoritesNotifier,
              builder: (context, favoriteSongs, _) {
                return ListView.builder(
                  itemCount: recentSongs.length,
                  itemBuilder: (context, index) {
                    final song = recentSongs[index];
                    final isFavorite = favoritesManager.isFavorite(song);

                    return ListTile(
                      leading: song['imagePath'] != null
                          ? Image.asset(
                              song['imagePath']!,
                              width: 50, // Adjust the width of the image
                              height: 50, // Adjust the height of the image
                              fit: BoxFit.cover, // Ensure the image scales nicely
                            )
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
                              songList: recentSongs,
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
