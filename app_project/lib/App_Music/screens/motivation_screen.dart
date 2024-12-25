import 'package:flutter/material.dart';
import '../models/favorites_manager.dart'; // Ensure you have favoritesManager defined properly
import 'song_screen.dart'; // Assuming you have a SongScreen to play the song

class MotivationScreen extends StatelessWidget {
  final List<Map<String, dynamic>> motivationalSongs = [
    {
      'title': 'Die With A Smile',
      'artist': 'Lady Gaga, Bruno Mars',
      'imagePath': 'assets/images/image1.jpg',
      'mp3Path': 'music/music1.mp3',
      'isFavorite': false,
    },
    {
      'title': 'Until I Found You',
      'artist': 'Stephen Sanchez, Em Beihold',
      'imagePath': 'assets/images/image2.jpg',
      'mp3Path': 'music/music2.mp3',
      'isFavorite': false,
    },
    {
      'title': 'Here With Me',
      'artist': 'd4vd',
      'imagePath': 'assets/images/image3.jpg',
      'mp3Path': 'music/music3.mp3',
      'isFavorite': false,
    },
    {
      'title': 'It is You',
      'artist': 'Ali Gatie',
      'imagePath': 'assets/images/image4.jpg',
      'mp3Path': 'music/music4.mp3',
      'isFavorite': false,
    },
    {
      'title': 'Those Eyes',
      'artist': 'New West',
      'imagePath': 'assets/images/image5.jpg',
      'mp3Path': 'music/music5.mp3',
      'isFavorite': false,
    },
    {
      'title': 'Can I Be Him',
      'artist': 'James Arthur',
      'imagePath': 'assets/images/image6.jpg',
      'mp3Path': 'music/music6.mp3',
      'isFavorite': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Motivational Songs", 
        style: TextStyle(color: Colors.white),),
        iconTheme: const IconThemeData(color: Colors.white), // Set back button color to white
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Motivational Songs",
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<List<Map<String, dynamic>>>(
              valueListenable: favoritesManager.favoritesNotifier, // Ensure favoritesManager is set up
              builder: (context, favoriteSongs, _) {
                return ListView.builder(
                  itemCount: motivationalSongs.length,
                  itemBuilder: (context, index) {
                    final song = motivationalSongs[index];
                    final isFavorite = favoritesManager.isFavorite(song);

                    return ListTile(
                      leading: song['imagePath'] != null
                          ? Image.asset(
                              song['imagePath']!,
                              width: 50,  // Adjust image size
                              height: 50,
                              fit: BoxFit.cover,
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
                        // Navigate to SongScreen to play the selected song
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SongScreen(
                              songList: motivationalSongs,
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
