import 'package:flutter/material.dart';
import 'custom_bottom_nav_bar.dart';
import 'home_screen.dart';
import 'search_page.dart';
import 'favorite_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final int _currentIndex = 3;

  void _onNavBarTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
    } else if (index == 1) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SearchPage()));
    } else if (index == 2) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => FavoritePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Account"),
      ),
      backgroundColor: Colors.black,
      body: const Center(
        child: Text("Account Page", style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onItemTapped: _onNavBarTapped,
      ),
    );
  }
}
