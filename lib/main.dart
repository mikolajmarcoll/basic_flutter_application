import 'package:flutter/material.dart';
import 'package:flutter_application/screens/gallery_screen.dart';
import 'package:flutter_application/screens/home_screen.dart';
import 'package:flutter_application/screens/test_screen.dart';
import 'package:flutter_application/screens/user_details_screen.dart';
import 'package:flutter_application/screens/users_screen.dart';
import 'package:flutter_application/models/user_model.dart';
import 'api/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      routes: {
        "/users": (context) => UsersScreen(title: "Users"),
        "/user": (context) => const UserDetailScreen(user: null),
        "/test": (context) => const TestScreen(title: "test"),
        "/gallery": (context) => GalleryScreen(title: "Users"),
      },
    );
  }
}
