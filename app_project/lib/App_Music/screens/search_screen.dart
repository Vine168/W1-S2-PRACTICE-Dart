import 'package:flutter/material.dart';
import '../models/favorites_manager.dart';
import 'song_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // All song lists combined for searching
  final List<Map<String, dynamic>> allSongs = [
    // Motivational Songs (MotivationScreen)
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

  List<Map<String, dynamic>> searchResults = [];

  // Search logic
  void searchSongs(String query) {
    setState(() {
      searchResults = allSongs.where((song) {
        final title = song['title'].toLowerCase();
        final artist = song['artist'].toLowerCase();
        final searchQuery = query.toLowerCase();
        return title.contains(searchQuery) || artist.contains(searchQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Search Songs", style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: searchSongs,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Search by song title or artist",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.black,
                prefixIcon: Icon(Icons.search, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final song = searchResults[index];
                final isFavorite = favoritesManager.isFavorite(song);

                return ListTile(
                  leading: song['imagePath'] != null
                      ? Image.asset(
                          song['imagePath']!,
                          width: 50,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SongScreen(
                          songList: allSongs,
                          initialIndex: index,
                        ),
                      ),
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
