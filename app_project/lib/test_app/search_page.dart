import 'package:flutter/material.dart';
import 'custom_bottom_nav_bar.dart';
import 'home_screen.dart';
import 'favorite_page.dart';
import 'account_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final int _currentIndex = 1;

  void _onNavBarTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
    } else if (index == 2) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => FavoritePage()));
    } else if (index == 3) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => AccountPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Search"),
      ),
      backgroundColor: Colors.black,
      body: const Center(
        child: Text("Search Page", style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onItemTapped: _onNavBarTapped,
      ),
    );
  }
}
