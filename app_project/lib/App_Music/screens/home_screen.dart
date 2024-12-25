import 'package:flutter/material.dart';
import '../widgets/home_screen/bottom_nav_bar.dart';
import '../widgets/home_screen/grid_section.dart';
import '../widgets/home_screen/list_section.dart';
// import '../widgets/mini_player.dart';
import '../models/favorites_manager.dart';
import 'search_screen.dart';
import 'account_screen.dart';
import 'favorite_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onNavBarTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomeContent(),
    SearchScreen(), // Replace with your SearchScreen
    FavoriteScreen(), // Replace with your FavoriteScreen
    AccountScreen(), // Replace with your AccountScreen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      
      body: Stack(
        children: [
          IndexedStack(
            index: _currentIndex,
            children: _pages,
          ),
          // MiniPlayer(), // Mini-player appears across all pages
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavBarTapped,
      ),
    );
  }
}

// Separate home content for better structure
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridSection(),
          ListSection(
            onSongFavoriteToggle: (song) {
              if (favoritesManager.favoriteSongs.contains(song)) {
                favoritesManager.removeFavorite(song);
              } else {
                favoritesManager.addFavorite(song);
              }
            },
          ),
        ],
      ),
    );
  }
}