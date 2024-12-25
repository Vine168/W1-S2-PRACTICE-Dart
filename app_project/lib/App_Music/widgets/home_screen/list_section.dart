import 'package:flutter/material.dart';
import '../../screens/song_screen.dart';

class ListSection extends StatefulWidget {
  final Function(Map<String, dynamic>) onSongFavoriteToggle;

  ListSection({required this.onSongFavoriteToggle});

  @override
  _ListSectionState createState() => _ListSectionState();
}

class _ListSectionState extends State<ListSection> {
  // The song list (this will now be mutable)
  final List<Map<String, dynamic>> songList = [
    {
      'title': 'Die With A Smile',
      'artist': 'Lady Gaga, Bruno Mars',
      'imagePath': 'assets/images/image1.jpg',
      'mp3Path': 'music/music1.mp3',
      'isFavorite': false,
    },
    {
      'title': 'Until I Found You ',
      'artist': 'Stephen Sanchez, Em Beihold',
      'imagePath': 'assets/images/image2.jpg',
      'mp3Path': 'music/music2.mp3',
      'isFavorite': false,
    },
    {
      'title': ' Here With Me ',
      'artist': 'd4vd ',
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
      'artist': 'James Arthur ',
      'imagePath': 'assets/images/image6.jpg',
      'mp3Path': 'music/music6.mp3',
      'isFavorite': false,
    },
    {
      'title': 'Look After You',
      'artist': 'The Fray',
      'imagePath': 'assets/images/image7.jpg',
      'mp3Path': 'music/music7.mp3',
      'isFavorite': false,
    },
    {
      'title': 'Waiting Room',
      'artist': 'Phoebe Bridgers',
      'imagePath': 'assets/images/image8.jpg',
      'mp3Path': 'music/music8.mp3',
      'isFavorite': false,
    },
  ];

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
                  ? Image.asset(
                      song['imagePath']!,
                      width: 50, // Set fixed size for image
                      height: 50,
                      fit: BoxFit.cover, // Ensure the image is scaled to fit
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
                  song['isFavorite'] ? Icons.favorite : Icons.favorite_border,
                  color: song['isFavorite'] ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    // Toggle favorite status
                    song['isFavorite'] = !song['isFavorite'];
                  });
                  widget.onSongFavoriteToggle(song); // Call the callback to notify the parent
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
