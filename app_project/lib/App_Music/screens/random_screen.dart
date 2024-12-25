import 'package:flutter/material.dart';
import '../models/favorites_manager.dart';
import 'song_screen.dart';

class RandomScreen extends StatelessWidget {
  final List<Map<String, dynamic>> randomSongs = [
    {
      'title': 'Stay',
      'artist': 'The Kid LAROI & Justin Bieber',
      'imagePath': 'assets/images/image14.jpg',
      'mp3Path': 'music/music14.mp3',
    },
    {
      'title': 'Kiss Me More',
      'artist': 'Doja Cat',
      'imagePath': 'assets/images/image15.jpg',
      'mp3Path': 'music/music15.mp3',
    },
    {
      'title': 'I Love U',
      'artist': 'Chim Vine',
      'imagePath':'assets/images/image16.jpg',
      'mp3Path': 'music/music16',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Random Songs", 
        style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Random Songs",
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<List<Map<String, dynamic>>>(
              valueListenable: favoritesManager.favoritesNotifier,
              builder: (context, favoriteSongs, _) {
                return ListView.builder(
                  itemCount: randomSongs.length,
                  itemBuilder: (context, index) {
                    final song = randomSongs[index];
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
                              songList: randomSongs,
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
