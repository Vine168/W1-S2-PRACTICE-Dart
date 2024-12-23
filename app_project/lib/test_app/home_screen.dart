import 'package:flutter/material.dart';
import 'song_card.dart';
import 'motivation_song.dart';
import 'popular_song.dart';
import 'recent_song.dart';
import 'random_song.dart';
import 'song_list_item.dart';
import 'song_screen.dart'; // New screen for MP3 playback

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Mock data for list songs
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


  // Bottom Navigation Logic
  void _onNavBarTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGridSection(context),
            _buildListHeader(),
            const SizedBox(height: 8),
            _buildListSection(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  // AppBar Widget
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      leading: const Icon(Icons.arrow_back, color: Colors.white),
      actions: const [
        Icon(Icons.info_outline, color: Colors.white),
        SizedBox(width: 16),
      ],
    );
  }

  // Grid Section for Song Categories
  Widget _buildGridSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 2 / 1.3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: [
          SongCard(
            imagePath: 'assets/images/image1.jpg',
            title: 'Motivation Song',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MotivationSongPage())),
          ),
          SongCard(
            imagePath: 'assets/images/image2.jpg',
            title: 'Popular Song',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PopularSongPage())),
          ),
          SongCard(
            imagePath: 'assets/images/image3.jpg',
            title: 'Recent Song',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RecentSongPage())),
          ),
          SongCard(
            imagePath: 'assets/images/image4.jpg',
            title: 'Random Song',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RandomSongPage())),
          ),
        ],
      ),
    );
  }

  // Header for Song List
  Widget _buildListHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("List Song", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          Text("See All", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildListSection() {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: songList.length,
    itemBuilder: (context, index) {
      final song = songList[index];
      return SongListItem(
        title: song['title']!,
        artist: song['artist']!,
        imagePath: song['imagePath']!,
        isFavorite: song['isFavorite']!,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SongScreen(
                title: song['title']!,
                artist: song['artist']!,
                mp3Path: song['mp3Path']!,
                imagePath: song['imagePath']!,
              ),
            ),
          );
        },
        onToggleFavorite: () {
          // Toggle logic here for favorites
        },
      );
    },
  );
}


  // Bottom Navigation Bar
  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onNavBarTapped,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Account"),
      ],
    );
  }
}
