// import 'package:app_project/test_app/motivation_song.dart';
import 'package:flutter/material.dart';
// import '../../screens/motivation_screen.dart';
import '../../screens/motivation_screen.dart';
// import '../../screens/motivation_screen.dart';
import '../../screens/recent_screen.dart';
import '../../screens/popular_screen.dart';
import '../../screens/random_screen.dart';
import '../../screens/song_card.dart';


class GridSection extends StatelessWidget {
  const GridSection({super.key});

  @override
  Widget build(BuildContext context) {
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
            imagePath: 'assets/images/motivation.jpg',
            title: 'Motivation Song',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MotivationScreen())),
          ),
          SongCard(
            imagePath: 'assets/images/popular.jpg',
            title: 'Popular Song',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PopularScreen())),
          ),
          SongCard(
            imagePath: 'assets/images/recent.jpg',
            title: 'Recent Song',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RecentScreen())),
          ),
          SongCard(
            imagePath: 'assets/images/random.jpg',
            title: 'Random Song',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RandomScreen())),
          ),
        ],
      ),
    );
  }
}
