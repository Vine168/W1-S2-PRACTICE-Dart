import 'package:flutter/material.dart';

class ProfileData {
  final String name;
  final String position;
  final String avatarUrl;
  final List<TileData> tiles;

  ProfileData({
    required this.name,
    required this.position,
    required this.avatarUrl,
    required this.tiles,
  });
}

class TileData {
  final IconData icon;
  final String title;
  final String data;

  TileData({
    required this.icon,
    required this.title,
    required this.data, required String value,
  });
}
final ProfileData vineProfile = ProfileData(
  name: "Chim Vine",
  position: "Flutter Developer",
  avatarUrl: 'assets/images/image2.jpg',
  tiles: [
    TileData(icon: Icons.phone, title: "Phone Number", data: "+855 884 834 024", value: ''),
    TileData(icon: Icons.location_on, title: "Address", data: "Cambodia", value: ''),
  ],
);
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileApp(profile: vineProfile),
  ));
}

const Color mainColor = Color(0xff5E9FCD);
class ProfileApp extends StatelessWidget {
  final ProfileData profile;

  const ProfileApp({super.key, required this.profile});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor.withAlpha(100),
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text(
          'CADT student Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          // Profile Picture
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(profile.avatarUrl),
          ),
          const SizedBox(height: 20),
          // Name
          Text(
            profile.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: mainColor,
            ),
          ),
          Text(
            profile.position,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          // Tiles for profile details
          ...profile.tiles.map((tile) => ProfileTile(
                icon: tile.icon,
                title: tile.title,
                data: tile.data,
              )),
        ],
      ),
    );
  }
}
class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String data;

  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Icon(icon, color: mainColor),
          title: Text(title),
          subtitle: Text(data),
        ),
      ),
    );
  }
}
