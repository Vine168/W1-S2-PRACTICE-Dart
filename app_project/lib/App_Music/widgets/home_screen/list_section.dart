import 'package:flutter/material.dart';
import '../../screens/song_screen.dart';

class ListSection extends StatelessWidget {
  final List<Map<String, dynamic>> songList = [
    {
      'title': 'Motivation Song',
      'artist': 'John Doe',
      'imagePath': 'assets/images/image1.jpg',
      'mp3Path': 'music/music1.mp3',
      'isFavorite': false,
    },
    {
      'title': 'Popular Song',
      'artist': 'Jane Smith',
      'imagePath': 'assets/images/image2.jpg',
      'mp3Path': 'music/music2.mp3',
      'isFavorite': false,
    },
    {
      'title': 'Recent Song',
      'artist': 'The Rockstars',
      'imagePath': 'assets/images/image3.jpg',
      'mp3Path': 'music/music3.mp3',
      'isFavorite': false,
    },
    {
      'title': 'Random Song',
      'artist': 'DJ Random',
      'imagePath': 'assets/images/image4.jpg',
      'mp3Path': 'music/music4.mp3',
      'isFavorite': false,
    },
  ];

  final Function(Map<String, dynamic>) onSongFavoriteToggle;

  ListSection({required this.onSongFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "List Song",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Text(
                "See All",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: songList.length,
          itemBuilder: (context, index) {
            final song = songList[index];
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
                  song['isFavorite'] ? Icons.favorite : Icons.favorite_border,
                  color: song['isFavorite'] ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  // Toggle favorite status
                  onSongFavoriteToggle(song);
                  // Update the song's favorite status locally
                  song['isFavorite'] = !song['isFavorite'];
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SongScreen(
                      songList: songList,
                      initialIndex: index,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}