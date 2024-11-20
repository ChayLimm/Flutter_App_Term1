import 'package:flutter/material.dart';
// import 'package:test1/W5-S2-List-Inputs/1%20-%20START%20CODE/EXERCISE-2/model/profile_tile_model.dart';
import 'package:fluttermain/W6_S2/EXERCISE-2/model/profile_tile_model.dart';
 
ProfileData chaylimProfile = ProfileData(
    name: "ChayLim",
    position: "Flutter Developer",
    avatarUrl: 'assets/images/Luffy.gif',
    tiles: [
      TileData( icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
      TileData(icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
      TileData(icon: Icons.school, title: "Major", value: "Software engineering"),
      TileData(icon: Icons.add_location, title: "City", value: "PhnomPenh"),
      TileData(icon: Icons.email, title: "Mail", value: "Chay.lim@cadt.edu"),
      TileData(icon: Icons.person, title: "Full Name", value: "Chay Lim"),
      TileData(icon: Icons.date_range, title: "Birthdate", value: "12 March 2002"),
      TileData(icon: Icons.phone_android, title: "Contact", value: "+855 96 123 4567"),

    ]);
