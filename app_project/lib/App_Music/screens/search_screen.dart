import 'package:flutter/material.dart';
import 'database_helper.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> allSongs = [];
  List<Map<String, dynamic>> filteredSongs = [];
  String query = "";

  @override
  void initState() {
    super.initState();
    _fetchSongs(); // Load songs
  }

  Future<void> _fetchSongs() async {
    allSongs = await dbHelper.getSongs();
    setState(() {
      filteredSongs = allSongs; // Show all songs initially
    });
  }

  void updateSearch(String value) async {
    setState(() {
      query = value;
    });
    if (query.isNotEmpty) {
      filteredSongs = await dbHelper.searchSongs(query);
    } else {
      filteredSongs = allSongs;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Songs"),
        backgroundColor: Colors.black87, // Dark color for AppBar
      ),
      body: Container(
        color: Colors.black, // Dark background for the whole screen
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: updateSearch,
              style: TextStyle(color: Colors.white), // Text color for input field
              decoration: InputDecoration(
                labelText: "Search",
                labelStyle: TextStyle(color: Colors.white70), // Label text color
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white38), // Border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white), // Focused border color
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: filteredSongs.isEmpty
                  ? const Center(
                      child: Text(
                        "No results found",
                        style: TextStyle(color: Colors.white), // No results text color
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredSongs.length,
                      itemBuilder: (context, index) {
                        final song = filteredSongs[index];
                        return ListTile(
                          title: Text(
                            "${song['title']} - ${song['artist']}",
                            style: TextStyle(color: Colors.white), // Text color for song titles
                          ),
                          tileColor: index.isEven
                              ? Colors.grey[850]
                              : Colors.grey[900], // Alternating row colors
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
