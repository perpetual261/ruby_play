import 'package:flutter/material.dart';
import 'package:ruby_play/features/music/favorite_page.dart';
import 'package:ruby_play/features/music/home_page.dart';
import 'package:ruby_play/features/music/search_page.dart';
import 'package:ruby_play/features/playlist/playlists_page.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 0;

  List<Widget> pages = [
    HomePage(),
    FavoritePage(),
    SearchPage(),
    PlaylistsPage(),
  ];
  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: "Playlist",
          ),
        ],
      ),
    );
  }
}
