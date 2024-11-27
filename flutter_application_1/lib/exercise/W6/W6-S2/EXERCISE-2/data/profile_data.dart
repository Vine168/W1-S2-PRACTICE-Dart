import 'package:flutter/material.dart';
import 'package:flutter_application_1/exercise/W6/W6-S2/EXERCISE-2/model/profile_tile_model.dart';

ProfileData vineProfile = ProfileData(
    name: "Vine",
    position: "Flutter Developer",
    avatarUrl: 'assets/images/image2.jpg',
    tiles: [
      TileData(
        icon: Icons.phone,
        title: "Phone Number",
        value: "+855 884 834 024",
      ),
      TileData(
        icon: Icons.location_on,
        title: "Address",
        value: "123 Cambodia",
      ),
      TileData(
        icon: Icons.email,
        title: "Mail",
        value: "chimvine777@gmail.com",
      )
    ]);
