// import 'package:flutter/material.dart';
// import '../widgets/song_card.dart';
// import '../widgets/song_list_item.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         leading: Icon(Icons.arrow_back, color: Colors.white),
//         actions: [
//           Icon(Icons.info_outline, color: Colors.white),
//           SizedBox(width: 16),
//         ],
//       ),
//       backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Grid Section
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Motivation Song",
//                     style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 8),
//                   _buildGridSection(),
//                 ],
//               ),
//             ),

//             // List Song Section
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "List Song",
//                     style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     "See All",
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 8),
//             _buildListSection(),
//           ],
//         ),
//       ),
//       bottomNavigationBar: _buildBottomNavBar(),
//     );
//   }

//   Widget _buildGridSection() {
//     return GridView.count(
//       crossAxisCount: 2,
//       childAspectRatio: 2 / 1.3,
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       mainAxisSpacing: 12,
//       crossAxisSpacing: 12,
//       children: [
//         SongCard(imagePath: 'assets/images/motivation.jpg'),
//         SongCard(imagePath: 'assets/images/popular.jpg'),
//         SongCard(imagePath: 'assets/images/recent.jpg'),
//         SongCard(imagePath: 'assets/images/random.jpg'),
//       ],
//     );
//   }

//   Widget _buildListSection() {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       itemCount: 6,
//       itemBuilder: (context, index) {
//         return SongListItem(
//           title: 'Name Song',
//           artist: 'Singer Name',
//           imagePath: 'assets/images/song${index + 1}.jpg',
//           isFavorite: index.isEven,
//         );
//       },
//     );
//   }

//   Widget _buildBottomNavBar() {
//     return BottomNavigationBar(
//       backgroundColor: Colors.black,
//       selectedItemColor: Colors.white,
//       unselectedItemColor: Colors.grey,
//       type: BottomNavigationBarType.fixed,
//       items: [
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//         BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
//         BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favourite"),
//         BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Account"),
//       ],
//     );
//   }
// }
