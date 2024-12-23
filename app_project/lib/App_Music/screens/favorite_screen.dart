import 'package:flutter/material.dart';
import '../models/favorites_manager.dart';
import 'song_screen.dart'; // Make sure to import the SongScreen

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Favorite Songs"),
      ),
      body: ValueListenableBuilder<List<Map<String, dynamic>>>(
        valueListenable: favoritesManager.favoritesNotifier,
        builder: (context, favoriteSongs, _) {
          if (favoriteSongs.isEmpty) {
            return const Center(
              child: Text(
                "No favorite songs yet.",
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            itemCount: favoriteSongs.length,
            itemBuilder: (context, index) {
              final song = favoriteSongs[index];
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
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  onPressed: () {
                    favoritesManager.removeFavorite(song);
                  },
                ),
                onTap: () {
                  // Navigate to the SongScreen to play the selected song
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SongScreen(
                        songList: favoriteSongs,
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
    );
  }
}