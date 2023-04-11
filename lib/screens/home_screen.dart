import 'package:flutter/material.dart';
import 'package:flutter_application/models/rive_asset.dart';
import 'package:flutter_application/screens/comments_screen.dart';
import 'package:flutter_application/screens/gallery_screen.dart';
import 'package:flutter_application/screens/users_screen.dart';
import 'package:flutter_application/widgets/navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;

  _handleChange(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  final List<Widget> screens = [
    const UsersScreen(
      title: "Users",
    ),
    const CommentsScreen(
      title: "Comments",
    ),
    const GalleryScreen(
      title: "Gallery",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        selectedBottomNav: bottomNavs[_currentPageIndex],
        handleChange: (index) => _handleChange(index),
      ),
      body: screens[_currentPageIndex],
    );
  }
}
